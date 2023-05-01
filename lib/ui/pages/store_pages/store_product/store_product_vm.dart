import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/blockchain/eth_utils.dart';
import 'package:network_app/blockchain/home_page.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_avatar_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/dialog_utls.dart';
import 'package:provider/provider.dart';


class StoreProductViewModel extends ViewModel {
  StoreProductViewModel(this.context, this.clotheModel);
  final BuildContext context;
  final ClotheModel clotheModel;

  Future<void> onBuyClothe() async {
    print('onBuyClothe');

    final erc721Provider = Provider.of<ERC721ContractNotifier>(context, listen: false);
    final userData = Provider.of<UserNotifier>(context, listen: false).userData;

    final newData = {
      'user_id' : userData.id,
      'clothe_id' : 7,
      'hash' : 'asdasdasdasdasdasd',
      'status' : 'created',
      'price' : 0.01,
    };

    try {
      await AppSupabase.client
          .from(AppSupabase.strOrders)
          .insert(newData);
    } catch (error) {
      print('create order error - $error');
    }

    // final hash = await erc721Provider.safeMint();

    // showReceipt(context, 'purchase', 'zzzzzzzzzzzzzz');


    // print('buyClothe');
    //
    // final userData = Provider.of<UserNotifier>(context, listen: false).userData;
    //
    // String type = clotheModel.type;
    // print('type $type');
    //
    // final currentList = type == 'body'
    //     ? userData.avatarBodyCupboard
    //     : userData.avatarHeadCupboard;
    // final keyName =
    // type == 'body' ? 'avatar_body_cupboard' : 'avatar_head_cupboard';
    //
    // print('currentList $currentList');
    //
    // final newList = [...currentList, clotheModel.id];
    //
    // print('newList $newList');
    //
    // await UserNotifier().updateData(
    //   newData: {keyName: newList},
    // );
    //
    // DialogUtils.openBottomSheetInfoWithIcon(
    //   context: context,
    //   icon: NetworkIcons.check_circle_outlined,
    //   text1: 'Оплата прошла ',
    //   text2: 'успешно',
    //   text3: 'Новую одежду вы можете\nнайти в своем шкафу',
    //   textButton: 'Перейти в шкаф',
    //   func: () {
    //     context.router.pop();
    //     context.router.push(
    //       HomeViewRoute(initIndex: 1, isCupboard: true),
    //     );
    //   },
    // );
    //
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
