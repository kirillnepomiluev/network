import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/profile_pages/orders/order_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  // final RefreshController _refreshController = RefreshController();

  List ordersList = [];
  bool showLoading = true;

  Future<void> getInit() async {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    await loadOrders(userNotifier);
  }

  Future<void> _onRefresh(UserNotifier userNotifier) async
  {
    await loadOrders(userNotifier);
    await Future.delayed(const Duration(milliseconds: 300));

    // _refreshController.refreshCompleted();
  }

  Future<void> loadOrders(UserNotifier userNotifier) async {
    setState(() {
      showLoading = true;
    });

    final userData = userNotifier.userData;
    ordersList = await AppSupabase.client
        .from(AppSupabase.strOrders)
        .select()
        .eq('user_id', userData.id)
        .order('id');

    // for (final item in ordersList) {
    //   final orderModel = OrderModel.fromMap(item);
    //
    //   bool created = orderModel.status=='created';
    //   if(created){
    //     final hash = orderModel.hash;
    //     final type = orderModel.clotheModel.type;
    //     final clotheID = orderModel.clotheID;
    //     final success = await EthereumUtils().getReciept(hash);
    //     if (success != null) {
    //       final newList = userData.avatarBodyCupboard;
    //       if (newList.contains(clotheID) == false) {
    //         newList.add(clotheID);
    //         await userNotifier.updateData(newData: {'avatar_body_cupboard': newList});
    //       }
    //       await AppSupabase.client.from(AppSupabase.strOrders).update({
    //         'status': 'done', //done, failed
    //         'success': success,
    //       }).eq('id', orderModel.id);
    //     }
    //   }
    // }

    setState(() {
      showLoading = false;
    });
  }

  @override
  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userNotifier = Provider.of<UserNotifier>(context);
    final userData = userNotifier.userData;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarRow(
                onPressed: () {
                  context.router.push(
                    HomeProfileViewRoute(isCupboardInit: true),
                    // predicate: (route) => false,
                  );
                },
                title: 'Orders',
              ),
              // const CupboardScreenUpdateRow(onlyUpdate: true),
              SizedBox(
                height: Res.s35,
              ),
              Expanded(
                child:

                RefreshIndicator(
                  onRefresh: () async {
                    await _onRefresh(userNotifier);
                  },
                  child:
                  showLoading?
                  const Center(child: CircularProgressIndicator(),)
                      :
                  ListView.builder(
                    // physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: ordersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final dataMap = ordersList[index];
                      return OrderContainer(dataMap: dataMap);
                    },
                  ),
                )
                // StreamBuilder(
                //   stream: AppSupabase.client
                //       .from(AppSupabase.strOrders)
                //       .stream(primaryKey: ['id'])
                //       .eq('user_id', userData.id)
                //       .order('created_date'),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       final list = snapshot.data! as List<Map<String, dynamic>>;
                //       return ListView.builder(
                //         physics: const NeverScrollableScrollPhysics(),
                //         shrinkWrap: true,
                //         itemCount: list.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           final dataMap = list[index];
                //           return OrderContainer(dataMap: dataMap);
                //         },
                //       );
                //     }
                //     return const Center(child: CircularProgressIndicator());
                //   },
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
