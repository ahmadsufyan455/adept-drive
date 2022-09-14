import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriveController extends GetxController {
  late TextEditingController nameController;
  var folders = <String>['Documents'].obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
  }

  void addFolder(String name) {
    folders.add(name);
  }

  void editFolder(String newName, int index) {
    folders[index] = newName;
  }

  void deleteFolder(int index) {
    folders.removeAt(index);
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }
}
