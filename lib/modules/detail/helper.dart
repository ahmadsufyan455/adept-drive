import 'package:adept_drive/model/drive_response.dart';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import '../../widgets/custom_textfield.dart';

Future<dynamic> openAddEditDialog(
  BuildContext context,
  ActionState actionState,
  int? index,
) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: actionState == ActionState.add
            ? Text('Add New Folder', style: kHeadingRegular)
            : Text(
                'Edit Folder',
                style: kHeadingRegular,
              ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const [
              CustomTextField(
                inputType: TextInputType.name,
                hint: 'File name',
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
          actionState == ActionState.add
              ? TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : TextButton(
                  child: const Text('Edit'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
        ],
      );
    },
  );
}

Future<dynamic> openDeleteDialog(
  BuildContext context,
  int index,
  DriveData data,
) async {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          'Delete ${data.name}',
          style: kHeadingRegular,
        ),
        content: Text(
          'Are you sure want to delete this file ?',
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

Widget bottomSheetLayout(BuildContext context, int index, DriveData data) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Text('Action', style: kBodyRegular),
        const SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            openAddEditDialog(context, ActionState.edit, index);
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
            openDeleteDialog(context, index, data);
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

enum ActionState {
  add,
  edit,
}
