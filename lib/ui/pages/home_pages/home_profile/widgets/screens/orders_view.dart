import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/cupboard_screen_update_row.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/utils/res.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context).userData;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarRow(
                onPressed: () {
                  context.router.push(
                    HomeProfileViewRoute(isCupboardInit: true),
                    // predicate: (route) => false,
                  );
                },
                title: AppString.of(context).listOfPersonalRequests,
              ),
              const CupboardScreenUpdateRow(onlyUpdate: true),
              SizedBox(
                height: Res.s35,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: AppSupabase.client
                      .from(AppSupabase.strOrders)
                      .stream(primaryKey: ['id'])
                      .eq('user_id', userData.id)
                      .order('created_date'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final list = snapshot.data! as List<Map<String, dynamic>>;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dataMap = list[index];
                          final orderModel = OrderModel.fromMap(dataMap);

                          return Padding(
                            padding: EdgeInsets.only(bottom: Res.s20),
                            child: AppContainer(
                              width: double.infinity,
                              padV: Res.s26,
                              padH: Res.s18,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '# ${orderModel.id} ${orderModel.title}',
                                      ),

                                      Icon(
                                        orderModel.success==null?
                                            Icons.access_time :
                                        orderModel.success!?
                                        Icons.check_circle
                                        : Icons.highlight_remove_outlined
                                        , color:orderModel.success==null? Colors.white : orderModel.success!? Colors.green : Colors.red,)

                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${orderModel.price} ETH',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'https://goerli.etherscan.io/tx/${orderModel.hash}'));
                                    },
                                    child: Text(
                                      'Посмотреть транзакцию',
                                      style: AppTextStyles.primary
                                          .copyWith(color: Colors.blue),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class OrderModel {
  final int id;
  final String userID;
  final String title;
  final int clotheID;
  final DateTime createdDate;
  final String hash;
  final String status;
  final String type;
  final bool? success;
  final double price;

  OrderModel(
      {required this.id,
      required this.title,
      required this.userID,
      required this.clotheID,
      required this.createdDate,
      required this.hash,
      required this.status,
      required this.type,
      required this.success,
      required this.price});

  factory OrderModel.fromMap(Map<String, dynamic> dataMap) {
    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;

    return OrderModel(
      id: dataMap['id'],
      userID: dataMap['user_id'],
      clotheID: dataMap['clothe_id'],
      createdDate: createdDate,
      hash: dataMap['hash'],
      price: dataMap['price'],
      status: dataMap['status'],
      success: dataMap['success'],
      title: dataMap['title'],
      type: dataMap['type'],
    );
  }
}
