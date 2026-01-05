import 'dto_tmdb_movie.dart';

class DtoTmdbPage {
  final int num;
  final List<DtoTmdbMovie> results;

  DtoTmdbPage({required this.num, required this.results});
}
