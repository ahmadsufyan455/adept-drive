import 'package:adept_drive/utils/constants.dart';
import 'package:adept_drive/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class WebViewWorkFlow extends StatelessWidget {
  const WebViewWorkFlow({super.key});

  static const routeName = '/webview_workflow';

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Workflow Form',
          style: kHeadingRegular,
        ),
      ),
      body: WebView(
        initialUrl:
            '$baseURL/publish/get/${data[0]}?key=${data[1]}&userID=${data[2]}',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
