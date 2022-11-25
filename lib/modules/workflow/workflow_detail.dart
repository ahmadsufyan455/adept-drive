import 'package:adept_drive/modules/workflow/controller/workflow_detail_controller.dart';
import 'package:adept_drive/modules/workflow/workflow_webview.dart';
import 'package:adept_drive/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkflowDetailView extends StatelessWidget {
  const WorkflowDetailView({super.key});

  static const routeName = '/workflow_detail';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WorkflowDetailController());
    // final formController = Get.put(WorkflowFormController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.title.value,
          style: kHeadingRegular,
        ),
      ),
      body: controller.obx((state) {
        return ListView.builder(
          itemCount: state!.data!.steps!.length - 1,
          itemBuilder: (context, index) {
            final data = state.data!.steps![index];
            //formController.getFormDetail(data.process![0].forms![0].oid!);
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(
                      WebViewWorkFlow.routeName,
                      arguments: data.process![0].forms![0].oid!,
                    ),
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          children: [
                            Text(
                              'Step ${data.step} - ',
                              style: kHeadingRegular,
                            ),
                            Flexible(
                              child: Text(
                                data.title!,
                                style: kHeadingRegular,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const Divider(thickness: 2, height: 1, color: Colors.grey),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.toNamed(
                  //       WebViewWorkFlow.routeName,
                  //       arguments: data.process![0].forms![0].oid!,
                  //     );
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //       vertical: 16,
                  //       horizontal: 16,
                  //     ),
                  //     child: Text(
                  //       data.process![0].forms![0].oid!,
                  //       style: kHeadingRegular,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 4.0),
                  // Card(
                  //   elevation: 4.0,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //   ),
                  //   child: formController.obx((state) {
                  //     return ListTile(
                  //       contentPadding: const EdgeInsets.symmetric(
                  //         horizontal: 16.0,
                  //         vertical: 8.0,
                  //       ),
                  //       onTap: () {
                  //         Get.toNamed(
                  //           WebViewWorkFlow.routeName,
                  //           arguments: data.process![0].forms![0].oid!,
                  //         );
                  //       },
                  //       title: Text(
                  //         state!.data!.title!,
                  //         style: kHeadingRegular,
                  //       ),
                  //     );
                  //   }),
                  // ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
