import 'package:adept_drive/model/drive_folder.dart';
import 'package:get/get.dart';

import '../../provider/drive_provider.dart';

class SharedController extends GetxController with StateMixin<DriveFolder> {
  final _driveProvider = DriveProvider();

  @override
  void onInit() {
    super.onInit();
    getSharedFolder();
  }

  void getSharedFolder() {
    _driveProvider.getSharedFolder().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
