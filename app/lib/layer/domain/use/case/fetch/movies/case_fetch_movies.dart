import 'package:app/layer/data/repository/movies/dto_movie.dart';
import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';

class CaseFetchMovies {
  final PortFetchMovies source;

  CaseFetchMovies(this.source);

  Future<List<DtoMovie>> invoke() => source.loadTopRated(1);
}
