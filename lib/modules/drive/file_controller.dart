import 'package:adept_drive/model/drive_body.dart';
import 'package:adept_drive/model/drive_file.dart';
import 'package:adept_drive/provider/drive_provider.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class FileController extends GetxController with StateMixin<DriveFile> {
  final _driveProvider = DriveProvider();

  @override
  void onInit() {
    super.onInit();
    getDriveFile(driveDefaultId);
  }

  void getDriveFile(String folderId) {
    FileBody fileBody = FileBody(folderID: folderId);
    _driveProvider.getFiles(fileBody.toJson()).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err));
    });
  }
}
