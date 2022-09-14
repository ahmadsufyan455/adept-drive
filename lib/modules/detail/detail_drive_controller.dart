import 'package:adept_drive/model/drive_body.dart';
import 'package:adept_drive/model/drive_response.dart';
import 'package:adept_drive/provider/drive_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailDriveController extends GetxController
    with StateMixin<DriveResponse> {
  final _driveProvider = DriveProvider();
  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    postDriveData();
    searchController = TextEditingController();
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
  }
}
