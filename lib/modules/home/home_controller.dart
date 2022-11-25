import 'package:adept_drive/modules/login/login_page.dart';
import 'package:adept_drive/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late SharedPreferences userPrefs;

  @override
  void onInit() async {
    super.onInit();
    userPrefs = await SharedPreferences.getInstance();
    final domain = userPrefs.getString('domain');
    baseURL = 'https://$domain.adeptforms.com';
  }

  void logout() async {
    userPrefs = await SharedPreferences.getInstance();
    userPrefs.remove('token');
    userPrefs.remove('domain');
    Get.offAllNamed(LoginPage.routeName);
  }
}
