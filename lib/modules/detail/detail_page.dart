import 'dart:io';

import 'package:adept_drive/modules/detail/detail_drive_controller.dart';
import 'package:adept_drive/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/styles.dart';
import 'helper.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  static const routeName = '/detail';

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
      ).then(
        (value) async {
          bool waitTask = true;
          while (waitTask) {
            String query = "SELECT * FROM task WHERE task_id='${value!}'";
            var tasks =
                await FlutterDownloader.loadTasksWithRawQuery(query: query);
            String taskStatus = tasks![0].status.toString();
            int taskProgress = tasks[0].progress;
            if (taskStatus == "DownloadTaskStatus(3)" && taskProgress == 100) {
              waitTask = false;
            }
          }
          await FlutterDownloader.open(taskId: value!);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailDriveController());
    final folderName = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          folderName,
          style: kHeadingRegular,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              controller: controller.searchController,
              icon: Icons.search_rounded,
              inputType: TextInputType.text,
              hint: 'Search file...',
            ),
          ),
          Expanded(
            child: controller.obx(
              (state) => ListView.builder(
                itemCount: state!.data!.data!.length,
                itemBuilder: (context, index) {
                  final driveData = state.data!.data![index];
                  return GestureDetector(
                    // should be downloaded file to local
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            title: Text(
                              'Download ${driveData.name}',
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
                                  downloadFile(driveData.fullpath!);
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
                            leading: leadingIcon(driveData.type!),
                            title: Text(driveData.name!, style: kBodyRegular),
                            subtitle:
                                Text(driveData.size!, style: kBodyRegularHint),
                            trailing: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
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
                                    return bottomSheetLayout(
                                      context,
                                      index,
                                      driveData,
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.more_vert_rounded),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              onEmpty: const Center(
                child: Text('Empty data'),
              ),
              onLoading: const Center(
                child: CircularProgressIndicator(),
              ),
              onError: (error) => Center(
                child: Text(
                  error.toString(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // should be more state for the icon
  Widget leadingIcon(String type) {
    return type == 'image/png'
        ? Image.asset('assets/icons/ic_png.png')
        : Image.asset('assets/icons/ic_pdf.png');
  }
}
