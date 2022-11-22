import 'dart:io';

import 'package:adept_drive/modules/child/child_controller.dart';
import 'package:adept_drive/modules/child/child_file_controller.dart';
import 'package:adept_drive/modules/child/child_page.dart';
import 'package:adept_drive/modules/detail/document_view.dart';
import 'package:adept_drive/utils/styles.dart';
import 'package:adept_drive/widgets/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ChildPageSub extends StatelessWidget {
  const ChildPageSub({super.key});

  static const routeName = '/child_sub';

  Future downloadFile(String url) async {
    final status = Platform.isAndroid
        ? await Permission.storage.request()
        : await Permission.mediaLibrary.request();
    if (status.isGranted) {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChildController());
    final fileController = Get.put(FileControllerChild());
    final indexData = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          indexData.name,
          style: kHeadingRegular,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: controller.obx(
              (state) {
                return indexData.children.isEmpty
                    ? emptyState('Folder')
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: indexData.children!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                ChildPage.routeName,
                                arguments: indexData.children![index],
                              );
                              Get.delete<FileControllerChild>();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/folder.svg',
                                      width: 60.0),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    indexData.children![index].name!,
                                    textAlign: TextAlign.center,
                                    style: kBodyRegular,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
          const Divider(
            height: 30,
            thickness: 2,
            indent: 16,
            endIndent: 16,
            color: kGrey,
          ),
          Expanded(
            child: fileController.obx(
              (state) {
                return state!.data!.isEmpty
                    ? emptyState('File')
                    : ListView.builder(
                        itemCount: state.data!.length,
                        itemBuilder: (context, index) {
                          final driveFile = state.data![index];
                          return GestureDetector(
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    title: Text(
                                      '${driveFile.name}',
                                      style: kBodyRegular,
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: Text(
                                              'Cancel',
                                              style: kBodyRegular,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              driveFile.access!.contains('view')
                                                  ? TextButton(
                                                      onPressed: () {
                                                        Get.toNamed(
                                                          DocumentView
                                                              .routeName,
                                                          arguments: driveFile
                                                              .fullpath,
                                                        );
                                                      },
                                                      child: Text(
                                                        'Preview',
                                                        style: kBodyBold,
                                                      ),
                                                    )
                                                  : Container(),
                                              driveFile.access!.contains('edit')
                                                  ? TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context,
                                                            'Download');
                                                        downloadFile(driveFile
                                                            .fullpath!);
                                                      },
                                                      child: Text(
                                                        'Download',
                                                        style: kBodyBold,
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 4,
                                bottom: 4,
                              ),
                              child: Card(
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading:
                                        Image.asset('assets/icons/ic_file.png'),
                                    title: Text(driveFile.name!,
                                        style: kBodyRegular),
                                    subtitle: Text(
                                      driveFile.size!,
                                      style: kBodyRegularHint,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
