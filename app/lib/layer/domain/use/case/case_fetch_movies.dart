import 'package:app/layer/data/repository/movies/repo_dto_movie.dart';

abstract class PortFetchMovies {
  Future<List<RepoDtoMovie>> getMovies(int start, int size);
  Future<List<RepoDtoMovie>> fetchMovies(int start, int size);
}

class CaseFetchMovies {
  final PortFetchMovies source;

  CaseFetchMovies(this.source);

  Future<List<RepoDtoMovie>> invoke() => source.getMovies(0, 20);
}
