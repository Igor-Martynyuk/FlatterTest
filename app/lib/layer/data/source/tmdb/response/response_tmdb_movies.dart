import 'package:app/layer/data/source/tmdb/response/response_tmdb_movie.dart';

class ResponseTmdbMovies {
  final int page;
  final List<ResponseTmdbMovie> results;

  ResponseTmdbMovies({required this.page, required this.results});
}
