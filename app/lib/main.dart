library;

import 'package:app/layer/data/source/db/lib.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/layer/data/repository/movies/repo_movies.dart';
import 'package:app/layer/ui/root.dart';
import 'package:sqflite/sqflite.dart';
import 'layer/data/source/web/lib.dart';
import 'layer/domain/use/case/case_fetch_movies.dart';

part 'create_api.dart';

part 'create_db.dart';

const _appName = "Flutter Playground";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbDecorator = await createDb();
  final apiDecorator = await createApi();

  final SrcMoviesLocal localMoviesSource = dbDecorator;
  final SrcMoviesRemote remoteMoviesSource = apiDecorator;
  final moviesRepository = RepoMovies(localMoviesSource, remoteMoviesSource);

  final PortFetchMovies fetchMoviesPort = moviesRepository;

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
