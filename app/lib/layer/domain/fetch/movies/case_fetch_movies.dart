import 'package:app/layer/data/source/source_tmdb_api.dart';
import 'package:app/layer/domain/fetch/movies/port_fetch_movies.dart';

class CaseFetchMovies {
  final PortFetchMovies source = SourceTmdbAPI.instance;

  Future<int> invoke() => source.loadTopRated(1);
}
