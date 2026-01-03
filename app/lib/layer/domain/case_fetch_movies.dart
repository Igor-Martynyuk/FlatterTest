import 'package:app/layer/data/source/web/api/api_tmdb.dart';
import 'package:app/layer/data/source/web/api/api_web.dart';

class CaseFetchMovies {
  final WebAPI source = TmdbAPI.instance;

  Future<int> invoke() => source.loadTopRated(1);
}
