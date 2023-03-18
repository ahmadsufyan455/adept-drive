import 'dart:io';

import 'package:adept_drive/model/upload_file.dart';
import 'package:get/get.dart';

import '../../provider/drive_provider.dart';

class UploadFileController extends GetxController with StateMixin<UploadFile> {
  final _driveProvider = DriveProvider();

  void uploadFile(String name, String folderID, String path) {
    FormData formData = FormData({
      'name': MultipartFile(File(path), filename: name),
      'folderID': folderID
    });
    _driveProvider.uploadFile(formData).then(
      (response) {
        change(response, status: RxStatus.success());
      },
      onError: (err) {
        change(null, status: RxStatus.error(err));
      },
    );
  }
}
