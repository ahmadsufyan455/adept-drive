import 'package:flutter/material.dart';

class UnderBuild extends StatelessWidget {
  const UnderBuild({super.key});

  static const routeName = '/under_build';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Image.asset('assets/warning.png'),
        ),
      ),
    );
  }
}
