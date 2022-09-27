import 'dart:isolate';
import 'dart:ui';

import 'package:adept_drive/model/drive_body.dart';
import 'package:adept_drive/model/drive_file.dart';
import 'package:adept_drive/provider/drive_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

class FileController extends GetxController with StateMixin<DriveFile> {
  final _driveProvider = DriveProvider();

  final ReceivePort _port = ReceivePort();

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  @override
  void onInit() {
    super.onInit();
    getDriveFile('000000000000000000000000');

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {});

    FlutterDownloader.registerCallback(downloadCallback);
  }

  void getDriveFile(String folderId) {
    FileBody fileBody = FileBody(folderID: folderId);
    _driveProvider.getFiles(fileBody.toJson()).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err));
    });
  }

  @override
  void onClose() {
    super.onClose();
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }
}
