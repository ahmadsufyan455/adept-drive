import 'package:adept_drive/modules/workflow/controller/workflow_controller.dart';
import 'package:adept_drive/modules/workflow/workflow_detail.dart';
import 'package:adept_drive/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkFlowList extends StatelessWidget {
  const WorkFlowList({super.key});

  static const routeName = '/workflow_list';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkflowController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Workflow',
          style: kHeadingRegular,
        ),
      ),
      body: controller.obx((value) {
        return ListView.builder(
          itemCount: value!.data!.length,
          itemBuilder: (context, index) {
            final data = value.data![index];
            return GestureDetector(
              onTap: () => Get.toNamed(
                WorkflowDetailView.routeName,
                arguments: [
                  {"id": data.iId!.oid},
                  {"title": data.title},
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    12.0,
                  )),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30.0,
                        horizontal: 16.0,
                      ),
                      child: Text(
                        data.title!,
                        textAlign: TextAlign.center,
                        style: kHeadingRegular,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
