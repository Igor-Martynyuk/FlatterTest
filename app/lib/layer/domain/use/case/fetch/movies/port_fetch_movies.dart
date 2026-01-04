import '../../../../../data/source/tmdb/response/dto_tmdb_movies.dart';

abstract class PortFetchMovies {
  Future<DtoTmdbMovies> loadTopRated(int page);
}
