import 'package:app/layer/ui/splash/screen_splash.dart';
import 'package:flutter/material.dart';

import 'home/screen_home.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _StateRoot();
}

class _StateRoot extends State<Root> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return isLoading == true ? const ScreenSplash() : const ScreenHome();
  }
}