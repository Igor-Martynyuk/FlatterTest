import 'package:app/layer/data/source/web/response/response_movie.dart';

class ResponseMovies {
  static const String _keyPage = "page";
  static const String _keyResults = "results";

  final int page;
  final List<ResponseMovie> results;

  ResponseMovies({required this.page, required this.results});

  factory ResponseMovies.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {_keyPage: int page, _keyResults: List results} => ResponseMovies(
        page: page,
        results: results
            .map((e) => ResponseMovie.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      _ => throw const FormatException("Failed to deserialize response body"),
    };
  }
}
