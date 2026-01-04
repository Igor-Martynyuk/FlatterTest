import 'dto_tmdb_movie.dart';

class DtoTmdbMovies {
  final int page;
  final List<DtoTmdbMovie> results;

  DtoTmdbMovies({required this.page, required this.results});
}
