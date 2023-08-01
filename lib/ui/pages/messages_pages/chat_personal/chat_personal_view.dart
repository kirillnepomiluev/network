import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/foundation.dart' as foundation;


class MessageModel{
  final int id;
  final int chatID;
  final DateTime createDate;
  final String userID;
  final String text;
  final String timeText;
  final String? imageUrl;

  MessageModel({
    required this.text,
    required this.timeText,
    required this.id, required this.chatID, required this.createDate, required this.userID, required this.imageUrl,
  });

  factory MessageModel.fromMap(Map<String, dynamic> dataMap){

    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;
    final timeText = timeago.format(createdDate, locale: 'en');

    return MessageModel(text: dataMap['text'], id: dataMap['id'], chatID: dataMap['chat_id'], createDate: createdDate, userID: dataMap['user_id'],
        imageUrl: dataMap['image_url'], timeText: timeText);
  }

}

class ChatPersonalView extends StatefulWidget {
  const ChatPersonalView({Key? key, required this.chatID, required this.partnerModel}) : super(key: key);
  final int chatID;
  final UserModel partnerModel;

  @override
  State<ChatPersonalView> createState() => _ChatPersonalViewState();
}

class _ChatPersonalViewState extends State<ChatPersonalView> {

  final textController = TextEditingController();
  bool showSendButton = false;
  final ScrollController scrollController = ScrollController();

  Future<void> sendFunction() async {

    final userData = Provider.of<UserNotifier>(context, listen: false).userData;
    print('sendFunction chatID ${widget.chatID} - userData ${userData.id} - text ${textController.text}');

    final id = await AppSupabase.client.from(AppSupabase.strMessages).insert({
      'user_id' : userData.id,
      'text' : textController.text,
      'chat_id' : widget.chatID
    }).select('id');

    print('messageID $id');

    textController.clear();
    setState(() {});
  }



  bool checked = false;

  void onChanged(String value) {
    if (value.isEmpty) {
      setState(() {
        showSendButton = false;
      });
    } else {
      setState(() {
        showSendButton = true;
      });
    }
  }

  FocusNode focusNode = FocusNode();


  void onEmojiTap() async {

    if(emojiShowing){

      setState(() {
        emojiShowing = !emojiShowing;
      });
      Future.delayed(Duration(milliseconds: 100));

        focusNode.requestFocus();
    }else{
        focusNode.unfocus();

        setState(() {
          emojiShowing = !emojiShowing;
        });

      // SystemChannels.textInput.invokeMethod('TextInput.hide');
    }



  }

  //////////////////////////////

  bool emojiShowing = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
        if (focusNode.hasFocus) {
          setState(() {
            emojiShowing = false;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        if(focusNode.hasFocus || emojiShowing){
          setState(() {
            emojiShowing = false;
          });
        }else{
          // Navigator.of(context).pop();
          context.router.pop();
        }
        return false;

        // context.router.push(HomeViewRoute(initIndex: 4));
        // return false;
      },
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          elevation: 0,
          title: const _AppBarTitle(),
        ),
        body:   Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(child: _Body(scrollController: scrollController, partnerModel: widget.partnerModel, chatID: widget.chatID,)),

            _BottomBar(
              focusNode: focusNode,
              onChanged: onChanged,
              textController: textController,
              showSendButton: showSendButton,
              sendFunction: sendFunction,
              emojiShowing: emojiShowing,
              onEmojiTap: onEmojiTap,
            )

          ],
        ),
        // body: _Body(scrollController: scrollController, messagesList: messagesList),
        // bottomNavigationBar: _BottomBar(onChanged: onChanged, controller: textController, showSendButton: showSendButton, sendFunction: sendFunction),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.scrollController,
    required this.partnerModel, required this.chatID,
  });

  final ScrollController scrollController;
  final UserModel partnerModel;
  final int chatID;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Utils.unFocus,
      child:
      StreamBuilder(
        stream: AppSupabase.client
            .from(AppSupabase.strMessages)
            .stream(primaryKey: ['id'])
            .eq('chat_id', chatID)
            .order('created_date'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data! as List<Map<String, dynamic>>;
            return
              ListView.builder(
                reverse: true,
                controller: scrollController,
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return
                    MessageCont(partnerModel: partnerModel, dataMap: list[index]);

                    // Column(
                    //   children: [
                    //     if (index == 0)
                    //       Padding(
                    //         padding: const EdgeInsets.only(bottom: 20),
                    //         child: Column(
                    //           children: [
                    //             Padding(
                    //               padding: const EdgeInsets.only(bottom: 25),
                    //               child: Text(
                    //                 'Сегодня, 12:01',
                    //                 style: TextStyle(
                    //                   fontSize: 15.5.sp, //12
                    //                   color: AppColors.textGray,
                    //                   fontWeight: FontWeight.w400,),
                    //               ),
                    //             ),
                    //             Container(
                    //               padding: const EdgeInsets.all(15),
                    //               width: MediaQuery.of(context).size.width * 0.9,
                    //               decoration: BoxDecoration(
                    //                 color: AppColors.white10,
                    //                 // color: Colors.grey.shade300,
                    //                 borderRadius: BorderRadius.circular(15),),
                    //               child: Row(
                    //                 children: [
                    //                   Padding(
                    //                     padding: const EdgeInsets.only(right: 20),
                    //                     child: SizedBox(
                    //                       height: 45,
                    //                       width: 48,
                    //                       child: Stack(
                    //                         alignment: Alignment.topCenter,
                    //                         children: [
                    //                           Positioned(
                    //                             top: 0,
                    //                             child: AppCircleAvatar(
                    //                               avatarUrl: partnerModel.avatarURL,
                    //                               // avatarUrl: 'assets/images/avatars/avatar_0.png',
                    //                               isAssetImage: false,
                    //                               contSize: 45,),),
                    //                           Positioned(
                    //                             right: 0,
                    //                             bottom: 0,
                    //                             child: Container(
                    //                               decoration:
                    //                               const BoxDecoration(
                    //                                 color:
                    //                                 AppColors.salad,
                    //                                 shape:
                    //                                 BoxShape.circle,),
                    //                               width: 17,
                    //                               height: 17,
                    //                               child: const Icon(
                    //                                 NetworkIcons.electric,
                    //                                 size: 7,
                    //                                 color: Colors.black,
                    //                               ),),)
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   Flexible(
                    //                     child: Column(
                    //                       crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                       children: [
                    //                         Text(
                    //                           'У вас запланирована встреча с Джоли',
                    //                           style: TextStyle(
                    //                             color: AppColors.salad,
                    //                             fontSize: 15.5.sp, //12
                    //                             fontWeight: FontWeight.w600,),
                    //                         ),
                    //                         Padding(
                    //                           padding: const EdgeInsets.only(top: 5),
                    //                           child: Text(
                    //                             'Пообщайтесь и обговорите важные моменты.',
                    //                             style: TextStyle(
                    //                               fontSize: 15.5.sp, //12
                    //                               fontWeight: FontWeight.w400,),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),),
                    //                 ],
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //
                    //       ),
                    //     MessageCont(partnerModel: partnerModel, dataMap: list[index]),
                    //   ],
                    // );
                },);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


class MessageCont extends StatelessWidget {
  const MessageCont({Key? key, required this.partnerModel, required this.dataMap,}) : super(key: key);
  final UserModel partnerModel;
  final Map<String, dynamic> dataMap;
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context,).userData;

    final messageModel = MessageModel.fromMap(dataMap);

    bool isYou = messageModel.userID == userData.id;
    String strText = messageModel.text;
    String timeText = messageModel.timeText;

    print('strText $strText');

    final mediaWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        left: 10, right: 10, top: 10,
        // bottom: timeText < 2 ? 0 : 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment:
        isYou ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: isYou ? mediaWidth * 0.67 : mediaWidth * 0.8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: isYou ? AppColors.salad : AppColors.white10,
              color: AppColors.white10,
            ),
            padding: const EdgeInsets.all(15),
            child: Text(strText,
              style: TextStyle(
                // color: isYou ? AppColors.textBlack : AppColors.textWhite,
                color: AppColors.textWhite,
                fontSize: 16.5.sp, //14
                fontWeight: FontWeight.w400,
              ),),
          ),
          // if (intMin < 2)
          //   Container()
          // else
            Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Row(
              mainAxisAlignment:
              isYou ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                if (isYou == false) Container() else Icon(
                  NetworkIcons.check_double,
                  color: AppColors.salad,
                  size: Res.s10, //12
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.5),
                  child: Text(
                    // '$intMin мин',
                    timeText,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key, required this.onChanged, required this.textController, required this.showSendButton, required this.sendFunction, required this.onEmojiTap, required this.emojiShowing, required this.focusNode, }) : super(key: key);
  final Function(String) onChanged;
  final TextEditingController textController;
  final bool showSendButton;
  final VoidCallback sendFunction;
  final VoidCallback onEmojiTap;
  final bool emojiShowing;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    final screenSize = MediaQuery.of(context).size;
    final emojiPadding = 18.00;
    final emojiSize = 32 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.30 : 1.0);
    final numEmojiColumns = (screenSize.width / (emojiSize + emojiPadding)).floor();
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(
        // left: 16, right: 16,
        top: 10,
        // bottom: keyboardSize + 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.circular(15),),
        child:

        Column(children: [
          SizedBox(
              // height: 66.0,
              // height: 60.0,
              // color: Colors.blue,
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: onEmojiTap,
                      icon: const Icon(
                        Icons.emoji_emotions,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child:
                      _TextEditor(onChanged: onChanged, controller: textController, focusNode: focusNode),

                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                        onPressed: sendFunction,
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  )
                ],
              )),

          if(emojiShowing)
            EmojiPicker(
              textEditingController: textController,
              config: Config(
                columns: numEmojiColumns,
                emojiSizeMax: emojiSize,
                verticalSpacing: 0,
                horizontalSpacing: 0,
                gridPadding: EdgeInsets.zero,
                initCategory: Category.RECENT,
                bgColor: const Color(0xFFF2F2F2),
                indicatorColor: Colors.blue,
                iconColor: Colors.grey,
                iconColorSelected: Colors.blue,
                backspaceColor: Colors.blue,
                skinToneDialogBgColor: Colors.white,
                skinToneIndicatorColor: Colors.grey,
                enableSkinTones: true,
                recentTabBehavior: RecentTabBehavior.RECENT,
                recentsLimit: 28,
                replaceEmojiOnLimitExceed: false,
                noRecents: const Text(
                  'No Recents',
                  style: TextStyle(fontSize: 20, color: Colors.black26),
                  textAlign: TextAlign.center,
                ),
                loadingIndicator: const SizedBox.shrink(),
                tabIndicatorAnimDuration: kTabScrollDuration,
                categoryIcons: const CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL,
                checkPlatformCompatibility: true,
              ),
            )

          // Offstage(
          //     offstage: !emojiShowing,
          //       child: EmojiPicker(
          //         textEditingController: textController,
          //         config: Config(
          //           columns: numEmojiColumns,
          //           emojiSizeMax: emojiSize,
          //           verticalSpacing: 0,
          //           horizontalSpacing: 0,
          //           gridPadding: EdgeInsets.zero,
          //           initCategory: Category.RECENT,
          //           bgColor: const Color(0xFFF2F2F2),
          //           indicatorColor: Colors.blue,
          //           iconColor: Colors.grey,
          //           iconColorSelected: Colors.blue,
          //           backspaceColor: Colors.blue,
          //           skinToneDialogBgColor: Colors.white,
          //           skinToneIndicatorColor: Colors.grey,
          //           enableSkinTones: true,
          //           recentTabBehavior: RecentTabBehavior.RECENT,
          //           recentsLimit: 28,
          //           replaceEmojiOnLimitExceed: false,
          //           noRecents: const Text(
          //             'No Recents',
          //             style: TextStyle(fontSize: 20, color: Colors.black26),
          //             textAlign: TextAlign.center,
          //           ),
          //           loadingIndicator: const SizedBox.shrink(),
          //           tabIndicatorAnimDuration: kTabScrollDuration,
          //           categoryIcons: const CategoryIcons(),
          //           buttonMode: ButtonMode.MATERIAL,
          //           checkPlatformCompatibility: true,
          //         ),
          //       ),
          //     ),

        ],)

      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Utils.unFocus,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBackButton(func: () {
            context.router.push(HomeViewRoute(initIndex: 4));
          },),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Джоли',
              style: TextStyle(
                fontSize: 20.sp, //20
                fontWeight: FontWeight.w600,),
            ),
          ),
          const AppIconContainer(icon: Icons.more_horiz_rounded),
        ],
      ),
    );
  }
}

class _TextEditor extends StatelessWidget {
  const _TextEditor({Key? key, required this.onChanged, required this.controller, required this.focusNode}) : super(key: key);
  final Function(String) onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: 110,
      ),
      // height: 75,
      child:
      TextField(
        focusNode: focusNode,
          maxLines: null,
          controller: controller,
          style: AppTextStyles.primary,
          textInputAction: TextInputAction.newline,
          // const TextStyle(
          //     fontSize: 20.0, color: Colors.black87),
          decoration: InputDecoration(
            hintText: 'Type a message',
            hintStyle: AppTextStyles.grey.copyWith(
                color: Colors.grey.shade600
            ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                ),
            // filled: true,
            // fillColor: Colors.white,
            contentPadding: const EdgeInsets.only(
                left: 16.0,
                bottom: 8.0,
                top: 8.0,
                right: 16.0),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(50.0),
            // ),
          ))

    );
  }
}
