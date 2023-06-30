import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/widgets/dialogs/simple_dialog.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart' as provider;
import 'package:supabase_flutter/supabase_flutter.dart';


class AvatarEditViewModel extends ViewModel {
  AvatarEditViewModel(this.context);
  final BuildContext context;

  FilePickerResult? result;
  bool showLoading = false;
  Uint8List? photoBytes;
  String photoName = '';

  bool photoChoosed = false;
  bool hasUploadedPhoto = false;

  File? file;


    Future<void> addPhotoFunc() async{

      result = await FilePicker.platform.pickFiles();

      if (result != null) {
        print('oook');
        file = File(result!.files.single.path!);
        photoBytes = result!.files.single.bytes;
        photoName = result!.files.single.name;
        photoChoosed = true;
        notifyListeners();
      } else {
        // User canceled the picker
      }

    // result = await FilePicker.platform.pickFiles(
    //   allowMultiple: false,
    // );
    //
    // if(result==null) return;
    //
    //
    // print('photoBytes $photoBytes');
    //
    // hasUploadedPhoto = false;

    notifyListeners();
  }


  Future<void> uploadPhotoFunc() async{

      if(file==null){
        print('Нет файла');
        return;
      }

      showLoading=true;
      notifyListeners();

    try {
      print('try');
      final avatarFile = file!;
      final userNotifier = provider.Provider.of<UserNotifier>(context, listen: false);

      final String path = await AppSupabase.client.storage.from('avatars').upload(
        '${userNotifier.userData.id}/$photoName',
        avatarFile,
        fileOptions: const FileOptions(upsert: true),
      );

      final url = '${AppSupabase.apiUrl}/storage/v1/object/public/$path';
      await userNotifier.updateData(newData: {
        'avatar_url' : url
      });

      print('finished - $path');
      showLoading=false;
      notifyListeners();
      context.router.pop();
    } on Exception catch (e) {
      print('error $e');

      showLoading=false;
      showSimpleDialog(title: 'Error', text: e.toString(), context: context);
      notifyListeners();
    }


    //   final path = Assets.images.avatars.avatar0.path;
    // final file = File(path);
    // final fileBytes = await file.readAsBytes();
    // await AppSupabase.client.storage
    //     .from('avatars')
    //     .uploadBinary(path, fileBytes);

      // final response = AppSupabase.client.storage.from('avatars').upload('test/${file.keyName}', File.fromRawPath(photoBytes!));

    // if(_hasUploadedVideo==false && _videoHave){
    //
    //   if(photoBytes==null){
    //     return showSimpleDialog(
    //       title: 'Нет видео',
    //       text: 'Загрузите видео',
    //       context: context,
    //     );
    //   }
    //   else{
    //
    //     String courseNumber = widget.courseNote['ID'].toString();
    //     String filePath = '';
    //
    //     UploadTask task = FirebaseStorage.instance.ref(filePath).putData(photoBytes!);
    //
    //     task.snapshotEvents.listen((event) {
    //       setState(() {
    //         // if(_progress!=100)
    //         _progress = ((event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) * 100).roundToDouble();
    //
    //         print('$_progress %');
    //       });
    //
    //       if (event.state == TaskState.success) {
    //         print('Видео успешно загружено');
    //
    //         // if (_progress == 100) {
    //         event.ref
    //             .getDownloadURL()
    //             .then((downloadUrl) async {
    //
    //           // print(downloadUrl);
    //
    //           videoURL = downloadUrl;
    //           lessonData.addAll({
    //             'videoURL' : videoURL,
    //           });
    //
    //           await docLesson.set(
    //               lessonData,
    //               SetOptions(merge: true)).then((value) {
    //             print('Загружено');
    //             Navigator.of(context).pop();
    //           }).catchError((error){
    //             print(error);
    //           });
    //
    //
    //           if(_isStartVideo){
    //             await coursesRef.doc(courseProdID).set({
    //               'videoURL' : videoURL,
    //             }, SetOptions(merge: true));
    //           }
    //
    //         } );
    //
    //       }
    //     }).onError((error) {
    //       showSimpleDialog(title: 'Ошибка', text: 'Ошибка при загрузке видео ($error)', context: context);
    //     });
    //   }
    // }
  }


}
