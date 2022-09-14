import 'package:adept_drive/modules/detail/detail_drive_controller.dart';
import 'package:adept_drive/modules/detail/document_view.dart';
import 'package:adept_drive/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';
import 'helper.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  static const routeName = '/detail';

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
                    onTap: () => Get.toNamed(
                      DocumentView.routeName,
                      arguments: driveData.fullpath,
                    ),
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
