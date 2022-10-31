import 'dart:isolate';
import 'dart:ui';

import 'package:adept_drive/model/drive_body.dart';
import 'package:adept_drive/model/drive_response.dart';
import 'package:adept_drive/provider/drive_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

class DetailDriveController extends GetxController
    with StateMixin<DriveResponse> {
  final _driveProvider = DriveProvider();
  late TextEditingController searchController;

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
    postDriveData();
    searchController = TextEditingController();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      if (status.toString() == "DownloadTaskStatus(3)" &&
          progress == 100 &&
          id != null) {
        String query = "SELECT * FROM task WHERE task_id='" + id + "'";
        var tasks = FlutterDownloader.loadTasksWithRawQuery(query: query);
        //if the task exists, open it
        if (tasks != null) FlutterDownloader.open(taskId: id);
      }
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  void postDriveData() {
    // initial data model
    final columns = <Columns>[
      Columns(data: 'name'),
      Columns(data: 'description'),
      Columns(data: 'size'),
      Columns(data: 'type'),
      Columns(data: 'createdAt'),
    ];
    final orders = <Order>[
      Order(column: '4', dir: 'desc'),
    ];
    final search = Search(
      value: '',
      regex: 'false',
    );
    final driveBody = DriveBody(
      draw: '1',
      columns: columns,
      order: orders,
      start: '0',
      length: '10',
      search: search,
    );

    _driveProvider.postDrive(driveBody.toJson()).then((driveResponse) async {
      change(driveResponse, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }
}
