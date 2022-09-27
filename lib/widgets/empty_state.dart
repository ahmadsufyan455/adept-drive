import 'package:adept_drive/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget emptyState(String title) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/empty.json', width: 200),
        const SizedBox(height: 10.0),
        Text('You don\'t have $title here!', style: kBodyRegular),
      ],
    ),
  );
}
