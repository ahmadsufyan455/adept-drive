import 'package:adept_drive/model/drive_folder.dart';
import 'package:adept_drive/provider/drive_provider.dart';
import 'package:get/get.dart';

class DriveController extends GetxController with StateMixin<DriveFolder> {
  final _driveProvider = DriveProvider();

  @override
  void onInit() {
    super.onInit();
    getDriveFolder();
  }

  void getDriveFolder() {
    _driveProvider.getFolder().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
