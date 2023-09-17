import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/clothe_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/core/providers/eth_utils.dart';
import 'package:network_app/app/core/providers/notifiers/wallet_provider.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/blockchain/contract_test_view.dart';
import 'package:network_app/ui/widgets/dialogs/dialog_with_button.dart';
import 'package:network_app/ui/widgets/dialogs/simple_dialog.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:provider/provider.dart';




class StoreProductViewModel extends ViewModel {
  StoreProductViewModel(this.context, this.clotheModel);
  final BuildContext context;
  final ClotheModel clotheModel;

  bool showButtonLoading = false;

  Future<void> onBuyClothe(ERC721ContractNotifier erc721Provider, WalletProvider walletProvider) async {

    final privateKey = walletProvider.privateKey;
    if(privateKey.isEmpty){
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) => AppDialogWithButton(title: 'You need to create a wallet', subTitle: "It's simple", buttonText: 'Go to wallet', buttonFunc: (){
          context.router.pop();
          context.router.push(HomeViewRoute(initIndex: 2));
        })

          );
    }

    showButtonLoading = true;
    notifyListeners();

    // final erc721Provider = Provider.of<ERC721ContractNotifier>(context, listen: false);
    final userData = Provider.of<UserNotifier>(context, listen: false).userData;
    // final walletProvider = Provider.of<WalletProvider>(context, listen: false);

    final hash = await erc721Provider.safeMint(walletProvider.walletAddress, walletProvider.privateKey);
    if(hash.isEmpty){
      showSimpleDialog(title: 'Error', text: 'Something went wrong', context: context);
      showButtonLoading = false;
      notifyListeners();
      return;
    }


    final newData = {
      'user_id' : userData.id,
      'clothe_id' : clotheModel.id,
      'price' : clotheModel.price,
      // 'title' : clotheModel.title,
      // 'type' : clotheModel.type,
      'hash' : hash,
      'status' : 'created', //done, failed
    };

    try {
      await AppSupabase.client
          .from(AppSupabase.strOrders)
          .insert(newData);
    } catch (error) {
      print('create order error - $error');
      showButtonLoading = false;
      notifyListeners();
      showSimpleDialog(title: 'Error', text: error.toString(), context: context);
    }

    showButtonLoading = false;
    notifyListeners();

    showReceiptDialog(context, hash);
  }










  // Future<void> onBuyClothe() async {
  //
  //   print('buyClothe');
  //
  //   final userData = Provider.of<UserNotifier>(context, listen: false).userData;
  //
  //   String type = clotheModel.type;
  //   print('type $type');
  //
  //   final currentList = type == 'body'
  //       ? userData.avatarBodyCupboard
  //       : userData.avatarHeadCupboard;
  //   final keyName =
  //       type == 'body' ? 'avatar_body_cupboard' : 'avatar_head_cupboard';
  //
  //   print('currentList $currentList');
  //
  //   final newList = [...currentList, clotheModel.id];
  //
  //   print('newList $newList');
  //
  //   await UserNotifier().updateData(
  //     newData: {keyName: newList},
  //   );
  //
  //   DialogUtils.openBottomSheetInfoWithIcon(
  //     context: context,
  //     icon: NetworkIcons.check_circle_outlined,
  //     text1: 'Оплата прошла ',
  //     text2: 'успешно',
  //     text3: 'Новую одежду вы можете\nнайти в своем шкафу',
  //     textButton: 'Перейти в шкаф',
  //     func: () {
  //       context.router.pop();
  //       context.router.push(
  //         HomeViewRoute(initIndex: 1, isCupboard: true),
  //       );
  //     },
  //   );
  // }

}
