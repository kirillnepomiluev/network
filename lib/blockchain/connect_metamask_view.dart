import 'package:flutter/material.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3dart/crypto.dart';

String truncateString(String text, int front, int end) {
  int size = front + end;

  if (text.length > size) {
    String finalString =
        "${text.substring(0, front)}...${text.substring(text.length - end)}";
    return finalString;
  }

  return text;
}

String generateSessionMessage(String accountAddress) {
  String message =
      'Hello $accountAddress, welcome to our app. By signing this message you agree to learn and have fun with blockchain';
  print(message);

  var hash = keccakUtf8(message);
  final hashString = '0x${bytesToHex(hash).toString()}';

  return hashString;
}



class ConnectMetamaskView extends StatefulWidget {
  const ConnectMetamaskView({Key? key}) : super(key: key);

  @override
  State<ConnectMetamaskView> createState() => _ConnectMetamaskViewState();
}

class _ConnectMetamaskViewState extends State<ConnectMetamaskView> {
  static const needChainID = 11155111;

  WalletConnect connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  SessionStatus? _session;
  String? _uri;
  String? _signature;

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        print(session.accounts[0]);
        print(session.chainId);
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    }
  }

  signMessageWithMetamask(BuildContext context, String message) async {
    if (connector.connected) {
      try {
        print("Message received");
        print(message);

        EthereumWalletConnectProvider provider =
        EthereumWalletConnectProvider(connector);
        launchUrlString(_uri!, mode: LaunchMode.externalApplication);
        var signature = await provider.personalSign(
            message: message, address: _session!.accounts[0], password: "");
        print(signature);
        setState(() {
          _signature = signature;
        });
      } catch (exp) {
        print("Error while signing transaction");
        print(exp);
      }
    }
  }

  getNetworkName(chainId) {
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
      case needChainID:
        return 'Sepolia Testnet';
      case 80001:
        return 'Mumbai Testnet';
      default:
        return 'Unknown Chain';
    }
  }

  @override
  Widget build(BuildContext context) {
    connector..on(
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
          print(_session!.accounts[0]);
          print(_session!.chainId);
        }))
    ..on(
        'disconnect',
            (payload) => setState(() {
          _session = null;
        }));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                      '${_session!.accounts[0]}',
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
                    if (_session!.chainId != needChainID) const Text(
                        'Network not supported. Switch to Sepolia') else (_signature == null)
                        ? Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: () =>
                              signMessageWithMetamask(
                                  context,
                                  generateSessionMessage(
                                      _session!.accounts[0])),
                          child: const Text('Sign Message', style: TextStyle(color: Colors.black))),
                    )
                        : Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Signature: ",
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
            else ElevatedButton(
                onPressed: () => loginUsingMetamask(context),
                child: const Text("Connect with Metamask", style: TextStyle(color: Colors.black),))
          ],
        ),
      ),
    );
  }
}
