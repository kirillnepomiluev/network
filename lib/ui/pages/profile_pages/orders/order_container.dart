import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/order_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/core/providers/eth_utils.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OrderContainer extends StatefulWidget {
  final Map<String, dynamic> dataMap;
  const OrderContainer({
    super.key,
    required this.dataMap,
  });

  @override
  State<OrderContainer> createState() => _OrderContainerState();
}

class _OrderContainerState extends State<OrderContainer> {

  OrderModel orderModelInit = OrderModel.emptyModel();
  bool showLoading = true;

  // Future<void> checkTransaction(OrderModel orderModel) async {
  //     // final orderModel = OrderModel.fromMap(widget.dataMap);
  //     final userNotifier = Provider.of<UserNotifier>(context, listen: false);
  //     final userData = userNotifier.userData;
  //
  //     bool created = orderModel.status=='created';
  //     if(created){
  //       final clotheModel = orderModel.clotheModel;
  //       print('checkTransaction of ${orderModel.id} - ${clotheModel.title} - userID ${userNotifier.userData.id}');
  //       final hash = orderModel.hash;
  //       // final clotheID = orderModel.clotheID;
  //       final success = await EthereumUtils().getReciept(hash);
  //       if (success != null) {
  //         final clotheID = clotheModel.id;
  //         final newList = userData.avatarBodyCupboard;
  //         if (newList.contains(clotheID) == false) {
  //           newList.add(clotheID);
  //           final Map<String, dynamic> newData = {
  //             'avatar_body_cupboard': newList,
  //           };
  //
  //           // Это временно убрал, но понадобится в будущем
  //           // if(userData.level<clotheModel.level){
  //               newData.addAll({
  //                 'avatar_body_id': clotheModel.id,
  //                 // 'level' : clotheModel.level
  //               });
  //             // }
  //
  //           await userNotifier.updateData(newData: newData);
  //         }
  //         await AppSupabase.client.from(AppSupabase.strOrders).update({
  //           'status': 'done', //done, failed
  //           'success': success,
  //         }).eq('id', orderModel.id);
  //       }
  //     }
  // }

  Future<void> getInit() async {
    // print('getInit - ${widget.dataMap}');
    orderModelInit = await OrderModel.create(widget.dataMap);

    // checkTransaction(orderModel);
    setState(() {
      showLoading = false;
    });
  }

  void onViewTransaction(){
    EthereumUtils.viewTransaction(orderModelInit.hash);
  }

  @override
  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final orderModel = OrderModel.fromMap(widget.dataMap);

    // print('order ${orderModel.id} - ${orderModel.clotheModel.title} - ${widget.dataMap}');
    return
      orderModelInit.id==null? Container():
      Padding(
      padding: EdgeInsets.only(bottom: Res.s20),
      child:
      AppContainer(
        width: double.infinity,
        padV: Res.s20,
        padH: Res.s18,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '# ${orderModel.id} ',
                    ),
                    Text(
                      orderModelInit.clotheModel.title, style: AppTextStyles.salad, maxLines: 1,
                    ),
                  ],
                ),
                Icon(
                  orderModel.success == null
                      ? Icons.access_time
                      : orderModel.success!
                          ? Icons.check_circle
                          : Icons.highlight_remove_outlined,
                  color: orderModel.success == null
                      ? Colors.white
                      : orderModel.success!
                          ? Colors.green
                          : Colors.red,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${orderModel.price} ETH', style: AppTextStyles.salad,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: onViewTransaction,
              child: Text(
                'View the transaction',
                style: AppTextStyles.primary.copyWith(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
