import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/order_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/app/core/providers/eth_utils.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';

class CupboardScreenUpdateRow extends StatefulWidget {
  const CupboardScreenUpdateRow({
    super.key, required this.onlyUpdate,
  });
  final bool onlyUpdate;

  @override
  State<CupboardScreenUpdateRow> createState() =>
      _CupboardScreenUpdateRowState();
}

class _CupboardScreenUpdateRowState extends State<CupboardScreenUpdateRow> {
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context).userData;

    return Row(
      mainAxisAlignment: widget.onlyUpdate? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
      children: [
        if (showLoading)
          const CircularProgressIndicator()
        else
          IconButton(
            onPressed: () async {
              setState(() {
                showLoading = true;
              });

              print('userID ${userData.id}');

              final orders = await AppSupabase.client
                  .from(AppSupabase.strOrders)
                  .select()
                  .eq('user_id', userData.id)
                  .eq('status', 'created');

              print('orders $orders');

              for (final item in orders) {
                final orderModel = OrderModel.fromMap(item);

                // const hash = '0x0b95ca9eddce85a174abfd32b9eff2a508c2aea459dbcfe884ceed06bdb158d0';
                final hash = orderModel.hash;
                final type = orderModel.clotheModel.type;
                final clotheID = orderModel.clotheID;

                print('hash $hash clotheID $clotheID');

                final success = await EthereumUtils().getReciept(hash);
                print('success $success');

                if (success != null)
                {
                  // final newList = type == 'body'
                  //     ? userData.avatarBodyCupboard
                  //     : userData.avatarHeadCupboard;

                  final newList = userData.avatarBodyCupboard;

                  if (newList.contains(clotheID) == false) {
                    newList.add(clotheID);
                    final key = type == 'body'
                        ? 'avatar_body_cupboard'
                        : 'avatar_head_cupboard';
                    await UserNotifier().updateData(newData: {key: newList});
                  }

                  await AppSupabase.client.from(AppSupabase.strOrders).update({
                    'status': 'done', //done, failed
                    'success': success,
                  }).eq('id', orderModel.id);
                }
              }

              setState(() {
                showLoading = false;
              });
            },
            icon: const Icon(
              Icons.update,
              color: Colors.white,
            ),
            iconSize: Res.s32,
          ),

        if(widget.onlyUpdate==false)
        AppButton(
            width: Res.s150,
            height: Res.s35,
            onPressed: () {
              context.router.push(const OrdersViewRoute());
            },
            text: 'Purchases'),
      ],
    );
  }
}
