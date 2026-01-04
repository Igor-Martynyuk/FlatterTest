import '../../../../../data/source/tmdb/dto/dto_tmdb_movies.dart';

abstract class PortFetchMovies {
  Future<DtoTmdbMovies> loadTopRated(int page);
}
