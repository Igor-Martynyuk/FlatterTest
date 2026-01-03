import 'dart:io';
import 'package:app/layer/data/source/web/api/api_web.dart';

class TmdbAPI implements WebAPI {
  static final TmdbAPI instance = TmdbAPI._();

  final envToken = 'TMB_ACCESS_TOKEN';
  final HttpClient _client = HttpClient()
    ..connectionTimeout = const Duration(seconds: 15);

  TmdbAPI._();

  String getToken() => String.fromEnvironment(envToken);

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
    request.headers.add(HttpHeaders.authorizationHeader, 'Bearer $getToken()');

    final response = await request.close();
    return response.statusCode;
  }
}
