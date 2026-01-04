import '../../../../../data/source/tmdb/response/response_movies.dart';

abstract class PortFetchMovies {
  Future<ResponseMovies> loadTopRated(int page);
}
