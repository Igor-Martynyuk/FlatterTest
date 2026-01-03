import 'package:app/layer/data/source/api_tmdb.dart';
import 'package:app/layer/domain/fetch/movies/port_fetch_movies.dart';

class CaseFetchMovies {
  final PortFetchMovies source = TmdbAPI.instance;

  Future<int> invoke() => source.loadTopRated(1);
}
