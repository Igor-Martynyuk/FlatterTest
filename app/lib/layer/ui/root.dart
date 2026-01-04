import 'package:app/layer/data/source/tmdb/mapper_tmb_api.dart';
import 'package:app/layer/data/source/tmdb/source_tmdb_api.dart';
import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';
import 'package:app/layer/ui/splash/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../domain/use/case/fetch/movies/case_fetch_movies.dart';
import 'home/screen_home.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _StateRoot();
}

class _StateRoot extends State<Root> {
  static const _tokenPrefix = "Bearer";
  static const _envToken = 'TMB_ACCESS_TOKEN';

  late final String token;
  late final MapperTmbApi mapper;
  late final PortFetchMovies moviesPort;
  late final CaseFetchMovies fetchMoviesCase;

  bool isLoading = true;

  Future<void> _load() async {
    var a = await fetchMoviesCase.invoke();
    for (var item in a) {
      debugPrint(item.title);
    }
    if (mounted) setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    final rawToken = dotenv.env[_envToken];
    if(rawToken == null || rawToken.isEmpty) throw StateError("token wasn't found");

    token = "$_tokenPrefix $rawToken";
    mapper = MapperTmbApi();
    moviesPort =  SourceTmdbAPI(mapper, token);
    fetchMoviesCase = CaseFetchMovies(moviesPort);

    _load();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? const ScreenSplash() : const ScreenHome();
  }
}
