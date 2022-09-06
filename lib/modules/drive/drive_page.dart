import 'package:adept_drive/modules/detail/detail_page.dart';
import 'package:adept_drive/modules/drive/drive_controller.dart';
import 'package:adept_drive/modules/drive/helper.dart';
import 'package:adept_drive/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DrivePage extends StatelessWidget {
  const DrivePage({super.key});

  static const routeName = '/drive';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DriveController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adept Drive',
          style: kHeadingRegular,
        ),
      ),
      body: Obx(
        () => controller.folders.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/empty.json', width: 250.0),
                    const SizedBox(height: 8.0),
                    Text('Your data is empty!', style: kBodyRegular),
                  ],
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      elevation: 8.0,
                      constraints: BoxConstraints(
                        maxHeight: Get.height / 3,
                      ),
                      enableDrag: true,
                      context: context,
                      builder: (context) {
                        return bottomSheetLayout(context, index);
                      },
                    ),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(
                        DetailPage.routeName,
                        arguments: controller.folders[index],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/folder.svg', width: 120.0),
                            const SizedBox(height: 4.0),
                            Text(
                              controller.folders[index],
                              style: kBodyRegular,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: controller.folders.length,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openAddEditDialog(context, 'add', 0),
        child: const Icon(
          Icons.add_rounded,
          color: kBlackDark,
        ),
      ),
    );
  }
}
