import 'package:adept_drive/modules/drive/drive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';
import '../../widgets/custom_textfield.dart';

Future<dynamic> openAddEditDialog(
  BuildContext context,
  String state,
  int? index,
) async {
  final controller = Get.find<DriveController>();
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: state == 'add'
            ? Text('Add New Folder', style: kHeadingRegular)
            : Text(
                'Edit Folder',
                style: kHeadingRegular,
              ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              CustomTextField(
                controller: controller.nameController,
                inputType: TextInputType.name,
                hint: 'Folder name',
                icon: Icons.folder_rounded,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          state == 'add'
              ? TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    controller.addFolder(controller.nameController.text);
                    Navigator.of(context).pop();
                  },
                )
              : TextButton(
                  child: const Text('Edit'),
                  onPressed: () {
                    controller.editFolder(
                      controller.nameController.text,
                      index!,
                    );
                    Navigator.of(context).pop();
                  },
                ),
        ],
      );
    },
  );
}

Future<dynamic> openDeleteDialog(BuildContext context, int index) async {
  final controller = Get.find<DriveController>();
  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          'Delete ${controller.folders[index]}',
          style: kHeadingRegular,
        ),
        content: Text(
          'Are you sure want to delete this folder ?',
          style: kBodyRegular,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text(
              'Cancel',
              style: kBodyRegular,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              controller.deleteFolder(index);
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
}

Widget bottomSheetLayout(BuildContext context, int index) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Text('Action', style: kBodyRegular),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            openAddEditDialog(context, 'edit', index);
          },
          child: Row(
            children: [
              const Icon(Icons.edit_rounded),
              const SizedBox(width: 16.0),
              Text('Edit', style: kBodyRegular),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            // do nothing
          },
          child: Row(
            children: [
              const Icon(Icons.share_rounded),
              const SizedBox(width: 16.0),
              Text('Share', style: kBodyRegular),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            openDeleteDialog(context, index);
          },
          child: Row(
            children: [
              const Icon(Icons.delete_rounded),
              const SizedBox(width: 16.0),
              Text('Delete', style: kBodyRegular),
            ],
          ),
        ),
      ],
    ),
  );
}
