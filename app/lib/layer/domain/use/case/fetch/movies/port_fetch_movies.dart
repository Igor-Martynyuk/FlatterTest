import '../../../../../data/source/tmdb/response/response_tmdb_movies.dart';

abstract class PortFetchMovies {
  Future<ResponseTmdbMovies> loadTopRated(int page);
}
