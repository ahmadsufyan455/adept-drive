import 'dart:io';

import 'package:adept_drive/modules/drive/shared_controller.dart';
import 'package:adept_drive/modules/drive/shared_file_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/styles.dart';
import '../../widgets/empty_state.dart';
import '../child/child_page.dart';

class SharedFolder extends StatelessWidget {
  const SharedFolder({super.key});

  static const routeName = '/shared_folder';

  Future downloadFile(String url) async {
    final baseStorage = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    final status = Platform.isAndroid
        ? await Permission.storage.request()
        : await Permission.mediaLibrary.request();
    if (status.isGranted) {
      await FlutterDownloader.enqueue(
        url: url,
        headers: {},
        savedDir: baseStorage!.path,
        showNotification: true,
        openFileFromNotification: true,
        saveInPublicStorage: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SharedController());
    final fileController = Get.put(SharedFileControler());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shared Folder',
          style: kHeadingRegular,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: controller.obx(
              (state) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(
                        ChildPage.routeName,
                        arguments: state.data![index],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/folder.svg', width: 60.0),
                            const SizedBox(height: 4.0),
                            Text(
                              state.data![index].name!,
                              textAlign: TextAlign.center,
                              style: kBodyRegular,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: state!.data!.length,
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
                                      'Download ${driveFile.name}',
                                      style: kHeadingRegular,
                                    ),
                                    content: Text(
                                      'Are you sure want to download this file ?',
                                      style: kBodyRegular,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: Text(
                                          'Cancel',
                                          style: kBodyRegular,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'OK');
                                          downloadFile(driveFile.fullpath!);
                                        },
                                        child: Text(
                                          'Ok',
                                          style: kBodyRegular,
                                        ),
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
