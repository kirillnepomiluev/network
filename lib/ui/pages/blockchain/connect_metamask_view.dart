import 'package:auto_route/auto_route.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/app/core/providers/eth_utils.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/crypto.dart';


String truncateString(String text, int front, int end) {
  int size = front + end;

  if (text.length > size) {
    String finalString =
        '${text.substring(0, front)}...${text.substring(text.length - end)}';
    return finalString;
  }

  return text;
}

String generateSessionMessage(String accountAddress) {
  String message = 'Hello $accountAddress, welcome to our app. By signing this message you agree to learn and have fun with blockchain';
  print(message);

  final hash = keccakUtf8(message);
  final hashString = '0x${bytesToHex(hash).toString()}';

  return hashString;
}

class ConnectMetamaskView extends StatefulWidget {
  const ConnectMetamaskView({Key? key}) : super(key: key);

  @override
  State<ConnectMetamaskView> createState() => _ConnectMetamaskViewState();
}

class _ConnectMetamaskViewState extends State<ConnectMetamaskView> {

  final jwtsecret =
      'zhLvPhnmjpEAzYWsiUEY035UfQqvfw11tr9nHwcnKBmaj/h8Mi1c5Ho1k1xa5eCmaKVdEmM2bC4B7f5CvTua3A==';

  Future<void> jwtGet() async {
// Create a json web token
// Pass the payload to be sent in the form of a map

    final jwt = JWT(
      // Payload
      {
        // 'id': 123,
        // 'server': {
        //   'id': '3e4fc296',
        //   'loc': 'euw-2',
        // }
      },

      issuer: 'supabase',
      audience: Audience.one('authenticated'),
      subject: '0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17',
      // jwtId: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBraWFxcmdja214ZG5xbGVya21mIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjM5Mzc2NzAsImV4cCI6MTk3OTUxMzY3MH0.7cmkp5glMfwICqPBtxan8f8W02vdtjZb8zVVjgdEgvo'
      //{
      //   "iss": "supabase",
      //   "ref": "pkiaqrgckmxdnqlerkmf",
      //   "role": "anon",
      //   "iat": 1663937670,
      //   "exp": 1979513670
      // }
    );

    // Sign it (default with HS256 algorithm)
    final token = jwt.sign(SecretKey(jwtsecret));

    print('Signed token: $token\n');

    AppSupabase.client.from(AppSupabase.strUsers).insert(
      {},
    );
  }

  Future<void> jwtTest() async {
    // final token = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2ODQyNTExMTAsImF1ZCI6ImF1dGhlbnRpY2F0ZWQiLCJzdWIiOiIweDA5QmU2ZDNGZjVhMkExMTBlMjExMTdlMUZGNjlENTVFNjFjQjViMTciLCJpc3MiOiJzdXBhYmFzZSJ9.OZ7kHa_Tk1yXM5zIywPGvUhxX3BiMF64jWzx9cqRy5E';

    // final res = await AppSupabase.client.functions.invoke(
    //   'hello-world',
    //   body: {'name': 'baa'},
    //   headers: {
    //     // 'Authorization': 'Bearer ${AppSupabase.client.auth.currentSession?.accessToken}'
    //     'Authorization': token
    //   },
    // );
    // print(res.status);
    // print(res.data);

    // const supabase = createClient("https://xyzcompany.supabase.co", "public-anon-key")
    // final test = await AppSupabase.client.auth.setSession(token);
    // print('test $test');
  }


  static final needChainID = EthereumUtils.webData.chainID; // 80001; //11155111, 5
  // static final needChainName = EthereumUtils.webData.chainName; // 80001; //11155111, 5

  WalletConnect connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          // url: 'https://coodes.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  SessionStatus? _session;
  String? _uri;
  String? _signature;

  Future<void> loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        print(session.accounts.first);
        print(session.chainId);
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    }
  }

  Future<void> signMessageWithMetamask(BuildContext context, String message) async {
    if (connector.connected) {
      try {
        print('Message received');
        print(message);

        EthereumWalletConnectProvider provider =
            EthereumWalletConnectProvider(connector);
        launchUrlString(_uri!, mode: LaunchMode.externalApplication);
        var signature = await provider.personalSign(
            message: message, address: _session!.accounts.first, password: '');
        print(signature);
        setState(() {
          _signature = signature;
        });
      } catch (exp) {
        print('Error while signing transaction');
        print(exp);
      }
    }
  }

  String getNetworkName(int chainId) {

    switch (chainId) {
      case 1:
        return 'Ethereum Mainnet';
      case 3:
        return 'Ropsten Testnet';
      case 4:
        return 'Rinkeby Testnet';
      case 5:
        return 'Goreli Testnet';
      case 42:
        return 'Kovan Testnet';
      case 137:
        return 'Polygon Mainnet';
      case 11155111:
        return 'Sepolia Testnet';
      case 80001:
        return 'Mumbai Testnet';
      default:
        return 'Unknown Chain';
    }
  }

  @override
  Widget build(BuildContext context) {
    connector
      ..on(
          'connect',
          (session) => setState(
                () {
                  _session = _session;
                },
              ))
      ..on(
          'session_update',
          (SessionStatus? payload) => setState(() {
                _session = payload;
                print(_session!.accounts.first);
                print(_session!.chainId);
              }))
      ..on(
          'disconnect',
          (payload) => setState(() {
                _session = null;
              }));

    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Page'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.icons.metamask.image(
              width: mediaWidth*0.5,
              height: mediaWidth*0.5
            ),

            const SizedBox(height: 30,),

            if (_session != null)
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Account',
                      ),
                      Text(
                        _session!.accounts.first,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text(
                            'Chain: ',
                          ),
                          Text(
                            getNetworkName(_session!.chainId),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (_session!.chainId != needChainID)
                        Text('Network not supported. Switch to ${getNetworkName(needChainID)}')
                      else
                        (_signature == null)
                            ? Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                    onPressed: () {

                                      context.router.push(HomeViewRoute());

                                      // signMessageWithMetamask(
                                      //   context,
                                      //   generateSessionMessage(
                                      //       _session!.accounts.first));

                                    },
                                    child: const Text('Continue',
                                        style: TextStyle(color: Colors.black))),
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Signature: ',
                                      ),
                                      Text(
                                          truncateString(
                                              _signature.toString(), 4, 2),
                                          style: GoogleFonts.inconsolata(
                                              fontSize: 16))
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              )
                    ],
                  ))
            else
              ElevatedButton(
                  onPressed: () => loginUsingMetamask(context),
                  child: const Text(
                    'Connect with Metamask',
                    style: TextStyle(color: Colors.black),
                  ))
          ],
        ),
      ),
    );
  }
}
