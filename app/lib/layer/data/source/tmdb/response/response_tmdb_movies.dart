import 'package:app/layer/data/source/tmdb/response/response_tmdb_movie.dart';

class ResponseTmdbMovies {
  static const String _keyPage = "page";
  static const String _keyResults = "results";

  final int page;
  final List<ResponseTmdbMovie> results;

  ResponseTmdbMovies({required this.page, required this.results});

  factory ResponseTmdbMovies.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {_keyPage: int page, _keyResults: List results} => ResponseTmdbMovies(
        page: page,
        results: results
            .map((e) => ResponseTmdbMovie.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      _ => throw const FormatException("Failed to deserialize response body"),
    };
  }
}
