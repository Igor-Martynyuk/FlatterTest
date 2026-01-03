import 'package:app/layer/domain/case_fetch_movies.dart';
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

  final CaseFetchMovies useCase = CaseFetchMovies();

  Future<void> _load() async {
    await useCase.invoke();
    if (mounted) setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true ? const ScreenSplash() : const ScreenHome();
  }
}
