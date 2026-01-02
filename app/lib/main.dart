import 'package:flutter/material.dart';

import 'layer/ui/home/screen_home.dart';
import 'layer/ui/splash/screen_splash.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: true == true ? const ScreenSplash() : const ScreenHome(),
    );
  }
}
