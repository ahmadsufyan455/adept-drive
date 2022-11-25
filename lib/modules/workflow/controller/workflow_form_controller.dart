import 'package:adept_drive/model/detail_form.dart';
import 'package:get/get.dart';

import '../../../provider/drive_provider.dart';

class WorkflowFormController extends GetxController
    with StateMixin<DetailForm> {
  final _driveProvider = DriveProvider();

  void getFormDetail(String id) {
    _driveProvider.getFormDetail(id).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
