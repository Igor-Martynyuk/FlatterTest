import 'package:app/l10n/app_localizations.dart';
import 'package:app/layer/ui/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'layer/data/source/tmdb/mapper_tmb_api.dart';
import 'layer/data/source/tmdb/source_tmdb_api.dart';
import 'layer/domain/use/case/fetch/movies/port_fetch_movies.dart';

const _appName = "Flutter Playground";
const _envFileName = ".env";
const _tokenType = "Bearer";
const _tokenEnv = 'TMB_ACCESS_TOKEN';
const _tokenFailedMsg = "token wasn't found";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: _envFileName);

  final rawToken = dotenv.env[_tokenEnv];
  if (rawToken == null || rawToken.isEmpty) throw StateError(_tokenFailedMsg);

  final token = "$_tokenType $rawToken";
  final mapper = MapperTmbApi();
  final tmdbApi = SourceTmdbAPI(mapper, token);

  final PortFetchMovies fetchMoviesPort = tmdbApi;

  runApp(_App(fetchMoviesPort));
}

class _App extends StatelessWidget {
  final PortFetchMovies fetchMoviesPort;

  const _App(this.fetchMoviesPort);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Root(fetchMoviesPort),
    );
  }
}
