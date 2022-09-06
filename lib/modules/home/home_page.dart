import 'package:adept_drive/modules/drive/drive_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Adept Drive',
          style: kHeadingRegular,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(DrivePage.routeName),
              child: Row(
                children: [
                  SvgPicture.asset('assets/folder.svg', width: 60),
                  const SizedBox(width: 16.0),
                  Text('Adept Drive', style: kBodyRegular),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
