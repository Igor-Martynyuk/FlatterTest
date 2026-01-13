import 'package:app/layer/ui/splash/screen_splash.dart';
import 'package:flutter/material.dart';

import '../domain/use/case/case_fetch_movies.dart';
import 'home/screen_home.dart';

class Root extends StatefulWidget {
  final CaseFetchMovies fetchMoviesCase;

  Root(PortFetchMovies fetchMoviesPort, {super.key})
    : fetchMoviesCase = CaseFetchMovies(fetchMoviesPort);

  @override
  State<Root> createState() => _StateRoot();
}

class _StateRoot extends State<Root> {
  bool isLoading = true;

  Future<void> _load() async {
    var a = await widget.fetchMoviesCase.execute();
    for (var item in a) {
      debugPrint("Item received: id: ${item.id}, name: ${item.name}");
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
