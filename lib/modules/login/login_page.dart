import 'package:adept_drive/modules/home/home_page.dart';
import 'package:adept_drive/modules/login/login_controller.dart';
import 'package:adept_drive/utils/styles.dart';
import 'package:adept_drive/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login to Adeptforms',
                    style: kHeadingRegular.copyWith(color: kGreyWhite),
                  ),
                  const SizedBox(height: 24.0),
                  CustomTextField(
                    controller: controller.usernameController,
                    inputType: TextInputType.name,
                    hint: 'Username',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    controller: controller.passwordController,
                    inputType: TextInputType.visiblePassword,
                    hint: 'Password',
                    icon: Icons.lock,
                    isObscure: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: kAmber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(HomePage.routeName);
                    },
                    child: Text(
                      'Login',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
