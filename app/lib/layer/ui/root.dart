import 'package:app/layer/ui/splash/screen_splash.dart';
import 'package:flutter/material.dart';

import '../domain/use/case/fetch/movies/case_fetch_movies.dart';
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
    var a = await useCase.invoke();
    for (var item in a) {
      debugPrint(item.title);
    }
    if (mounted) setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? const ScreenSplash() : const ScreenHome();
  }
}
