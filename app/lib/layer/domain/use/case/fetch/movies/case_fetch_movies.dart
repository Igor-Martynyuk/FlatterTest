import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';
import '../../../../../data/source/tmdb/response/dto_tmdb_movie.dart';

class CaseFetchMovies {
  final PortFetchMovies source;

  CaseFetchMovies(this.source);

  Future<List<DtoTmdbMovie>> invoke() async {
    final response = await source.loadTopRated(1);
    return Future.value(response.results);
  }
}
