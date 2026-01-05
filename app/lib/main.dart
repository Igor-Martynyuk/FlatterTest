import 'package:app/layer/data/repository/movies/src_movies_read.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/layer/data/repository/movies/repository_movies.dart';
import 'package:app/layer/ui/root.dart';
import 'package:sqflite/sqflite.dart';
import 'layer/data/source/web/mapper_tmb_api.dart';
import 'layer/data/source/web/api_tmdb.dart';
import 'layer/domain/use/case/fetch/movies/port_fetch_movies.dart';

const _appName = "Flutter Playground";
const _envFileName = ".env";
const _tokenType = "Bearer";
const _tokenEnv = 'TMB_ACCESS_TOKEN';
const _tokenFailedMsg = "token wasn't found";

const _moviesDbName = "movies_db.db";
const _moviesDbVersion = 1;
const _scriptCreateTable = "";

Future<ApiTmdb> _initTmdbApi() async {
  await dotenv.load(fileName: _envFileName);

  final rawToken = dotenv.env[_tokenEnv];
  if (rawToken == null || rawToken.isEmpty) throw StateError(_tokenFailedMsg);

  return ApiTmdb(MapperTmbApi(), "$_tokenType $rawToken");
}

Future<Database> _initMoviesDB() async {
  return await openDatabase(
    join(await getDatabasesPath(), _moviesDbName),
    onCreate: (db, version) {
      return db.execute(_scriptCreateTable);
    },
    version: _moviesDbVersion,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final tmdbApi = await _initTmdbApi();
  // final database = await _initMoviesDB();

  final SrcMoviesRead moviesRemoteSource = tmdbApi;
  final moviesRepository = RepositoryMovies(moviesRemoteSource);

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
