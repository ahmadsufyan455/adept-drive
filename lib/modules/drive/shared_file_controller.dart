import 'dart:ui';

import 'package:adept_drive/model/drive_body.dart';
import 'package:adept_drive/model/drive_file.dart';
import 'package:adept_drive/provider/drive_provider.dart';
import 'package:get/get.dart';

class SharedFileControler extends GetxController with StateMixin<DriveFile> {
  final _driveProvider = DriveProvider();

  @override
  void onInit() {
    super.onInit();
    getDriveFile('000000000000000000000001');
  }

  void getDriveFile(String folderId) {
    FileBody fileBody = FileBody(folderID: folderId);
    _driveProvider.getFiles(fileBody.toJson()).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err));
    });
  }

  @override
  void onClose() {
    super.onClose();
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }
}
