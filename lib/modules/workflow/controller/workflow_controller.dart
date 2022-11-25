import 'package:adept_drive/model/workflow_model.dart';
import 'package:adept_drive/provider/drive_provider.dart';
import 'package:get/get.dart';

class WorkflowController extends GetxController with StateMixin<Workflow> {
  final _driveProvider = DriveProvider();

  @override
  void onInit() {
    super.onInit();
    getWorkflows();
  }

  void getWorkflows() {
    _driveProvider.getWorkflows().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
