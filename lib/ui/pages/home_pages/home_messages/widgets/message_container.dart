import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/messages_pages/chat_personal/chat_personal_view.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessageContainer extends StatefulWidget {
  const MessageContainer({
    Key? key,
    required this.dataMap,
  }) : super(key: key);
  final Map<String, dynamic> dataMap;

  @override
  State<MessageContainer> createState() => _MessageContainerState();
}

class _MessageContainerState extends State<MessageContainer> {

  UserModel partnerModel = UserModel.emptyModel();

  Future<void> getInit() async {
    final userData = Provider.of<UserNotifier>(context, listen: false).userData;

    final searchID = userData.id == widget.dataMap['creator_id']? widget.dataMap['partner_id'] : widget.dataMap['creator_id'];

    // print('searchID $searchID');
    final dataMap = await AppSupabase.client.from(AppSupabase.strUsers).select().eq('id', searchID).single();
    // print('dataMap $dataMap');
    partnerModel = await UserModel.create(dataMap);
    setState(() {});
  }

  @override
  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double contWidth = 68.sp; //63
    final double contHeight = 60.sp; //63
    final double avatarSize = 35.sp; //63
    final chatID = widget.dataMap['id'];
    // print('chatID $chatID');
    return
      partnerModel.id==null? Container():
      // InkWell(
      //   onTap: () async {
      //     // print('on chat tap - ${userData.id} - ${partnerModel.id}');
      //     // final List dataList = await AppSupabase.client.from(AppSupabase.strChats).select().contains('users', [userData.id, partnerModel.id]);
      //     // // final List dataList = await AppSupabase.client.from(AppSupabase.strChats).select()
      //     // //     .or('creator_id.eq.${userData.id},partner_id.eq.${userData.id},')
      //     // //     .or('creator_id.eq.${partnerModel.id},partner_id.eq.${partnerModel.id},')
      //     // // ;
      //     //
      //     // print('dataList $dataList');
      //     //
      //     // int id = 0;
      //     // if(dataList.isEmpty){
      //     //   final dataMap = await AppSupabase.client.from(AppSupabase.strChats).insert({
      //     //     'creator_id' : userData.id,
      //     //     'partner_id' : partnerModel.id,
      //     //     'users' : [userData.id, partnerModel.id],
      //     //   }).select('id').single();
      //     //
      //     //   id = dataMap['id'];
      //     //   print('insertId $id');
      //     // }
      //     // else {
      //     //   id = dataList.first['id'];
      //     // }
      //     //
      //     // if(id>0){
      //     //   context.router.push(ChatPersonalViewRoute(
      //     //     chatID: id,
      //     //     partnerModel: partnerModel,
      //     //   ));
      //     // }
      //
      //     final id = chatID;
      //     if(id>0){
      //       context.router.push(ChatPersonalViewRoute(
      //           chatID: id,
      //           partnerModel: partnerModel,
      //           messagesList: []
      //       ));
      //
      //       // Navigator.push(
      //       //   context,
      //       //   MaterialPageRoute(
      //       //     builder: (context) => ChatPersonalView(
      //       //       chatID: id,
      //       //       partnerModel: partnerModel,
      //       //       messagesList: list,
      //       //     ),
      //       //   ),
      //       // );
      //
      //     }
      //   },
      //   child: Stack(
      //     alignment: Alignment.topCenter,
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.only(top: 27.sp), //35 - на сколько аватарка выше
      //         child: AppContainer(
      //           width: contWidth,
      //           height: contHeight,
      //           padH: Res.s10,
      //           padV: Res.s20,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             mainAxisSize: MainAxisSize.min,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Column(
      //                 children: [
      //                   SizedBox(
      //                     // height: 29.sp, //45
      //                     height: Res.s26, //45
      //                   ),
      //                   Text(partnerModel.name,
      //                     textAlign: TextAlign.center,
      //                     style: AppTextStyles.primary16
      //                         .copyWith(fontWeight: FontWeight.bold),),
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: Res.s16,
      //               ),
      //               // Row(
      //               //   mainAxisSize: MainAxisSize.min,
      //               //   children: [
      //               //     Padding(
      //               //       padding: const EdgeInsets.only(right: 4),
      //               //       child: Text(lastMessage.timeText,
      //               //         style: AppTextStyles.grey10
      //               //             .copyWith(fontWeight: FontWeight.w500),),
      //               //     ),
      //               //     Icon(
      //               //       NetworkIcons.check_double,
      //               //       size: Res.s12,
      //               //       color: AppColors.textGray,
      //               //     )
      //               //   ],
      //               // ),
      //               // const SizedBox(
      //               //   height: 6,
      //               // ),
      //               Text('lastMessage.text',
      //                 maxLines: 3,
      //                 overflow: TextOverflow.ellipsis,
      //                 style: AppTextStyles.primary,),
      //               SizedBox(
      //                 height: Res.s16,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(right: 4),
      //                 child: Align(
      //                   alignment: Alignment.bottomRight,
      //                   child: Text('lastMessage.timeText',
      //                     style: AppTextStyles.grey10
      //                         .copyWith(fontWeight: FontWeight.w500),),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //
      //       //аватарка
      //       SizedBox(
      //         height: avatarSize,
      //         width: avatarSize,
      //         child: Stack(
      //           alignment: Alignment.topCenter,
      //           children: [
      //             Positioned(
      //               top: 0,
      //               child: AppCircleAvatar(
      //                 avatarUrl: partnerModel.avatarURL,
      //                 contSize: avatarSize,
      //                 isAssetImage: false,
      //               ),),
      //             if (partnerModel.online)
      //               Positioned(
      //                 right: 7,
      //                 bottom: 0,
      //                 child: Icon(
      //                   Icons.circle,
      //                   size: Res.s14, //14
      //                   color: AppColors.salad,
      //                 ),)
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // )
      StreamBuilder(
          stream: AppSupabase.client
              .from(AppSupabase.strMessages)
              .stream(primaryKey: ['id'])
              .eq('chat_id', chatID)
              .order('created_date'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final list = snapshot.data! as List<Map<String, dynamic>>;
              // print('list $list');

              final lastMessage = list.isEmpty? MessageModel.emptyModel() : MessageModel.fromMap(list.first);
              return
                InkWell(
                  onTap: () async {
                    // print('on chat tap - ${userData.id} - ${partnerModel.id}');
                    // final List dataList = await AppSupabase.client.from(AppSupabase.strChats).select().contains('users', [userData.id, partnerModel.id]);
                    // // final List dataList = await AppSupabase.client.from(AppSupabase.strChats).select()
                    // //     .or('creator_id.eq.${userData.id},partner_id.eq.${userData.id},')
                    // //     .or('creator_id.eq.${partnerModel.id},partner_id.eq.${partnerModel.id},')
                    // // ;
                    //
                    // print('dataList $dataList');
                    //
                    // int id = 0;
                    // if(dataList.isEmpty){
                    //   final dataMap = await AppSupabase.client.from(AppSupabase.strChats).insert({
                    //     'creator_id' : userData.id,
                    //     'partner_id' : partnerModel.id,
                    //     'users' : [userData.id, partnerModel.id],
                    //   }).select('id').single();
                    //
                    //   id = dataMap['id'];
                    //   print('insertId $id');
                    // }
                    // else {
                    //   id = dataList.first['id'];
                    // }
                    //
                    // if(id>0){
                    //   context.router.push(ChatPersonalViewRoute(
                    //     chatID: id,
                    //     partnerModel: partnerModel,
                    //   ));
                    // }

                    final id = chatID;
                    if(id>0){
                      context.router.push(ChatPersonalViewRoute(
                        chatID: id,
                        partnerModel: partnerModel,
                        messagesList: []
                      ));

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ChatPersonalView(
                      //       chatID: id,
                      //       partnerModel: partnerModel,
                      //       messagesList: list,
                      //     ),
                      //   ),
                      // );

                    }
                  },
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 27.sp), //35 - на сколько аватарка выше
                        child: AppContainer(
                          width: contWidth,
                          height: contHeight,
                          padH: Res.s10,
                          padV: Res.s20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    // height: 29.sp, //45
                                    height: Res.s26, //45
                                  ),
                                  Text(partnerModel.name,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.primary16
                                        .copyWith(fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(
                                height: Res.s16,
                              ),
                              // Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(right: 4),
                              //       child: Text(lastMessage.timeText,
                              //         style: AppTextStyles.grey10
                              //             .copyWith(fontWeight: FontWeight.w500),),
                              //     ),
                              //     Icon(
                              //       NetworkIcons.check_double,
                              //       size: Res.s12,
                              //       color: AppColors.textGray,
                              //     )
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 6,
                              // ),
                              Text(lastMessage.text,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.primary,),
                              SizedBox(
                                height: Res.s16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(lastMessage.timeText,
                                    style: AppTextStyles.grey10
                                        .copyWith(fontWeight: FontWeight.w500),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //аватарка
                      SizedBox(
                        height: avatarSize,
                        width: avatarSize,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: 0,
                              child: AppCircleAvatar(
                                avatarUrl: partnerModel.avatarURL,
                                contSize: avatarSize,
                                isAssetImage: false,
                              ),),
                            if (partnerModel.online)
                              Positioned(
                                right: 7,
                                bottom: 0,
                                child: Icon(
                                  Icons.circle,
                                  size: Res.s14, //14
                                  color: AppColors.salad,
                                ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                );
            }
            return const Center(child: CircularProgressIndicator());
          },
        )
    ;
  }
}
