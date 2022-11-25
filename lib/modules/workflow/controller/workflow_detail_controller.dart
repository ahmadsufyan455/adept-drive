import 'package:adept_drive/model/workflow_detail.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../provider/drive_provider.dart';

class WorkflowDetailController extends GetxController
    with StateMixin<WorkflowDetail> {
  final _driveProvider = DriveProvider();
  RxString title = "".obs;
  RxString domain = "admin".obs;
  late SharedPreferences userPref;

  final data = Get.arguments;

  @override
  void onInit() async {
    super.onInit();
    getWorkflowDetail(data[0]['id']);
    title.value = data[1]['title'];
    userPref = await SharedPreferences.getInstance();
    domain.value = userPref.getString('domain')!;
  }

  void getWorkflowDetail(String id) {
    _driveProvider.getWorkflowDetail(id).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
