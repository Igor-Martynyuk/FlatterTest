import 'package:app/layer/domain/entity/movie.dart';

abstract class PortFetchMovies {
  Future<List<Movie>> getMovies(int start, int size);
  Future<List<Movie>> fetchMovies(int start, int size);
}

class CaseFetchMovies {
  final PortFetchMovies source;

  CaseFetchMovies(this.source);

  Future<List<Movie>> execute() => source.getMovies(0, 20);
}
