import 'dart:io';
import 'package:app/layer/data/source/web/api/api_web.dart';

class TmdbAPI implements WebAPI {
  static final TmdbAPI instance = TmdbAPI._();

  final String _token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjRlMjFlZGY2ODM5ZGUxNzE5NTIzNTQ1ZGMxOGM3YyIsIm5iZiI6MTc2NzQ0NjA0OS44NjksInN1YiI6IjY5NTkxNjIxYTg0MGNkYTYwMWNjOTA2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.aDAmsGwpZbCYfelyC0Q1PvQS8j-CqUmCJYSexAcIFoY';
  final HttpClient _client = HttpClient()
    ..connectionTimeout = const Duration(seconds: 15);

  TmdbAPI._();

  @override
  Future<int> loadTopRated(int page) async {
    final url = Uri(
      scheme: "https",
      host: "api.themoviedb.org",
      path: "3/discover/movie",
      queryParameters: {
        "include_adult": "true",
        "include_video": "false",
        "language": "en-US",
        "page": page.toString(),
      },
    );

    final request = await _client.getUrl(url);
    request.headers.add(HttpHeaders.authorizationHeader, 'Bearer $_token');

    final response = await request.close();
    return response.statusCode;
  }
}
