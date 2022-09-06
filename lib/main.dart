import 'package:adept_drive/modules/login/login_page.dart';
import 'package:adept_drive/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
** Intial with flutter 3.3.0
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
      ),
      initialRoute: LoginPage.routeName,
      getPages: pages,
    );
  }
}
