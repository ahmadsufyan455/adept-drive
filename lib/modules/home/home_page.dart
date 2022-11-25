import 'package:adept_drive/modules/drive/drive_page.dart';
import 'package:adept_drive/modules/home/home_controller.dart';
import 'package:adept_drive/modules/workflow/workflow_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
        title: Text(
          'Adeptforms',
          style: kHeadingRegular,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(
                DrivePage.routeName,
              ),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/adept_drive.svg', width: 60),
                      const SizedBox(width: 24.0),
                      Text('Adept Drive', style: kHeadingRegular),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(
                WorkFlowList.routeName,
              ),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/workflow_icon.svg', width: 60),
                      const SizedBox(width: 24.0),
                      Text('Workflow', style: kHeadingRegular),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
