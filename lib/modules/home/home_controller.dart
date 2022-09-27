import 'package:adept_drive/modules/login/login_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  void logout() async {
    final userPrefs = await SharedPreferences.getInstance();
    userPrefs.remove('token');
    Get.offAllNamed(LoginPage.routeName);
  }
}
