import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';
import '../../../../../data/source/tmdb/response/response_tmdb_movie.dart';
import '../../../../../data/source/tmdb/source_tmdb_api.dart';

class CaseFetchMovies {
  final PortFetchMovies source = SourceTmdbAPI.instance;

  Future<List<ResponseTmdbMovie>> invoke() async {
    final response = await source.loadTopRated(1);
    return Future.value(response.results);
  }
}
