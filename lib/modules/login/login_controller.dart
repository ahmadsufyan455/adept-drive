import 'package:adept_drive/modules/home/home_page.dart';
import 'package:adept_drive/provider/drive_provider.dart';
import 'package:adept_drive/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/request_token.dart';

class LoginController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late SharedPreferences userPrefs;

  final _driveProvider = DriveProvider();

  @override
  void onInit() async {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    userPrefs = await SharedPreferences.getInstance();

    if (userPrefs.getString('token')!.isNotEmpty) {
      Get.offNamed(HomePage.routeName);
    }
  }

  void requestDomain(Map data) {
    _driveProvider.requestDomain(data).then((response) {
      if (response.data!.subdomain!.length == 1) {
        final requestTokenBody = RequestTokenBody(
          username: usernameController.text,
          password: passwordController.text,
          subdomain: response.data!.subdomain!.first,
        );
        _driveProvider
            .requestToken(requestTokenBody.toJson())
            .then((domainResponse) async {
          await userPrefs.setString(
            'token',
            domainResponse.data!.token!,
          );
          await userPrefs.setString('domain', response.data!.subdomain!.first);
          Get.offAllNamed(HomePage.routeName);
        });
      } else {
        showDialog<String>(
          context: Get.context!,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Select domain', style: kBodyRegular),
            content: SizedBox(
              height: 150,
              width: 150,
              child: ListView.builder(
                itemCount: response.data!.subdomain!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final requestTokenBody = RequestTokenBody(
                        username: usernameController.text,
                        password: passwordController.text,
                        subdomain: response.data!.subdomain![index],
                      );
                      _driveProvider
                          .requestToken(requestTokenBody.toJson())
                          .then((domainResponse) async {
                        await userPrefs.setString(
                          'token',
                          domainResponse.data!.token!,
                        );
                        await userPrefs.setString(
                            'domain', response.data!.subdomain![index]);
                        Get.offAllNamed(HomePage.routeName);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(response.data!.subdomain![index]),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
    }).onError((error, stackTrace) {
      Get.snackbar(
          'Something went wrong', 'Username and Password doesn\'t Match');
    });
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
