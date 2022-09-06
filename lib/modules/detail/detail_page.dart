import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final folderName = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          folderName,
          style: kHeadingRegular,
        ),
      ),
      body: Center(
        child: Text(
          'Document list here...',
          style: kHeadingRegular,
        ),
      ),
    );
  }
}
