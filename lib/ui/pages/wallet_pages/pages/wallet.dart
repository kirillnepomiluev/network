import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/app/core/providers/eth_utils.dart';
import 'package:network_app/app/core/providers/notifiers/wallet_provider.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/choose_meeting_screen.dart';
import 'package:network_app/ui/pages/wallet_pages/pages/nft_balances.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:url_launcher/url_launcher.dart';

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
    getInit();
  }

  String addresshex = '';

  bool _showLoading = false;

  Future<void> updataBalance(WalletProvider walletProvider) async {
    int newBalance = await WalletProvider.getBalances(
        address: addresshex,
        chainName: 'sepolia'
    );
    EtherAmount latestBalance = EtherAmount.fromInt(EtherUnit.wei, newBalance);
    print('latestBalance $latestBalance');
    String latestBalanceInEther = latestBalance.getValueInUnit(EtherUnit.ether).toString();

    strBalance = latestBalanceInEther;
  }

  Future<void> onRefresh(WalletProvider walletProvider) async {

    setState(() {
      _showLoading = true;
    });

    await walletProvider.getNftList();
    await updataBalance(walletProvider);

    setState(() {
      _showLoading = false;
    });
  }

  Future<void> getInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? privateKey = prefs.getString('privateKey');
    if (privateKey != null) {
      final walletProvider = Provider.of<WalletProvider>(context, listen: false);
      // walletProvider.getNftList();

      await walletProvider.loadPrivateKey();
      EthereumAddress address = await walletProvider.getPublicKey(privateKey);
      print(address.hex);
      setState(() {
        walletAddress = address.hex;
        pvKey = privateKey;
      });
      print(pvKey);
      addresshex = address.hex;
      updataBalance(walletProvider);
    }
  }

  Future<void> onSendTap(ERC721ContractNotifier erc721Provider, WalletProvider walletProvider) async {

    // erc721Provider.safeMint();

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) =>
    //           SendTokensPage(privateKey: pvKey)),
    // );

  }

  static List optionsList = ['Ethereum', 'Polygon'];

  String strChoosed = optionsList.first;

  void onOptionChoosed(value){
    setState(() {
      strChoosed = value!;
    });
  }

  Future<void> onLogoutTap(WalletProvider walletProvider) async {

    await walletProvider.logout();

    // context.router.pushAndPopUntil(const WalletCreateOrImportPageRoute(), predicate: (route) => false);
    context.router.pushAndPopUntil(HomeViewRoute(initIndex: 2), predicate: (route) => false);
  }


  @override
  Widget build(BuildContext context) {
    final erc721Provider = Provider.of<ERC721ContractNotifier>(context);
    final walletProvider = Provider.of<WalletProvider>(context);
    // final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Wallet'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const Text('Wallet', style: AppTextStyles.primary20,),
              SizedBox(height: 20,),
              AppDropdownDynamic(optionsList: optionsList, strChoosed: strChoosed, onOptionChoosed: onOptionChoosed, width: 200, radius: 20,),
              SizedBox(height: 30,),

              Container(
                // height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    InkWell(
                      onTap: (){
                        Clipboard.setData(ClipboardData(text: walletAddress));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Wallet address copied to clipboard')),
                        );
                      },
                      child: Text(
                        walletAddress,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
              SizedBox(height: 30,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      FloatingActionButton(
                        heroTag: 'sendButton', // Unique tag for send button
                        onPressed: () {
                          onSendTap(erc721Provider, walletProvider);
                        },
                        child: const Icon(Icons.send),
                      ),
                      const SizedBox(height: 8.0),
                      const Text('Send'),
                    ],
                  ),
                  Column(
                    children: [
                      _showLoading?Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CircularProgressIndicator(),
                      ):
                      FloatingActionButton(
                        heroTag: 'refreshButton', // Unique tag for send button
                        onPressed: () async {
                          onRefresh(walletProvider);
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
              DefaultTabController(
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
                    SizedBox(
                      height: 460,
                      child: TabBarView(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ETH',
                                      style: AppTextStyles.primary16,
                                    ),
                                    Flexible(
                                      child: Text(
                                        strBalance,
                                        style: AppTextStyles.primary16,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),

                          const NftListScreen(),

                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                InkWell(
                                  onTap: (){
                                    launchUrl(Uri.parse(
                                        'https://etherscan.io/address/$walletAddress'
                                        // 'https://etherscan.io/address/0x09Be6d3Ff5a2A110e21117e1FF69D55E61cB5b17'
                                    ));
                                  },
                                  child: const Row(children: [
                                    Icon(Icons.web_outlined, color: Colors.white,),
                                    SizedBox(width: 10,),
                                    Text('Etherscan')
                                  ],),
                                ),

                              SizedBox(height: 20,),

                                InkWell(
                                  onTap: (){
                                    onLogoutTap(walletProvider);

                                  },
                                  child: const Row(children: [
                                    Icon(Icons.logout, color: Colors.white,),
                                    SizedBox(width: 10,),
                                    Text('Change wallet')
                                  ],),
                                ),

                            ],),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
