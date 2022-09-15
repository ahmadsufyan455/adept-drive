import 'package:flutter/material.dart';
import 'package:get/get.dart';

// this temp class
class DocumentView extends StatelessWidget {
  const DocumentView({super.key});

  static const routeName = '/doc_view';

  @override
  Widget build(BuildContext context) {
    final String documentPath = Get.arguments;
    return const Scaffold(
        body: Center(
      child: Text('Doc here...'),
    ));
  }
}
