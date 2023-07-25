import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/eth_utils.dart';
import 'package:network_app/app/core/providers/notifiers/wallet_provider.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/create_or_import.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/nft_balances.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/send_tokens.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String walletAddress = '';
  String strBalance = '';
  String pvKey = '';

  @override
  void initState() {
    super.initState();
    loadWalletData();
  }

  String addresshex = '';

  updateBalance() async {
    int newBalance = await WalletProvider.getBalances(
        address: addresshex,
        chainName: 'sepolia'
    );
    EtherAmount latestBalance = EtherAmount.fromInt(EtherUnit.wei, newBalance);
    print('latestBalance $latestBalance');
    String latestBalanceInEther = latestBalance.getValueInUnit(EtherUnit.ether).toString();

    setState(() {
      strBalance = latestBalanceInEther;
    });
  }

  Future<void> loadWalletData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? privateKey = prefs.getString('privateKey');
    if (privateKey != null) {
      final walletProvider = WalletProvider();
      await walletProvider.loadPrivateKey();
      EthereumAddress address = await walletProvider.getPublicKey(privateKey);
      print(address.hex);
      setState(() {
        walletAddress = address.hex;
        pvKey = privateKey;
      });
      print(pvKey);
      addresshex = address.hex;
      updateBalance();
    }
  }

  Future<void> onSendTap(ERC721ContractNotifier erc721Provider) async {

    erc721Provider.safeMint();

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) =>
    //           SendTokensPage(privateKey: pvKey)),
    // );
  }


  @override
  Widget build(BuildContext context) {
    final erc721Provider = Provider.of<ERC721ContractNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Wallet Address',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Text(
                  walletAddress,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32.0),
                const Text(
                  'Balance',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Text(
                  strBalance,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  FloatingActionButton(
                    heroTag: 'sendButton', // Unique tag for send button
                    onPressed: () {
                      onSendTap(erc721Provider);
                    },
                    child: const Icon(Icons.send),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Send'),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton(
                    heroTag: 'refreshButton', // Unique tag for send button
                    onPressed: () async {
                      updateBalance();
                    },
                    child: const Icon(Icons.replay_outlined),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Refresh'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Colors.blue,
                    tabs: [
                      Tab(text: 'Assets'),
                      Tab(text: 'NFTs'),
                      Tab(text: 'Options'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Assets Tab
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sepolia ETH',
                                    style: AppTextStyles.primary24,
                                  ),
                                  Flexible(
                                    child: Text(
                                      strBalance,
                                      style: AppTextStyles.primary24,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        // NFTs Tab
                        SingleChildScrollView(
                            child: NFTListPage(
                                address: walletAddress, chain: 'sepolia')),
                        // Activities Tab
                        Center(
                          child: ListTile(
                            leading: const Icon(Icons.logout),
                            title: const Text('Logout'),
                            onTap: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.remove('privateKey');
                              // ignore: use_build_context_synchronously
                              // Navigator.pushAndRemoveUntil(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const WalletCreateOrImportPage(),
                              //   ),
                              //   (route) => false,
                              // );

                              context.router.pushAndPopUntil(WalletCreateOrImportPageRoute(), predicate: (route) => false);

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
