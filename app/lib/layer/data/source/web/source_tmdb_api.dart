import 'dart:io';
import 'dart:convert';
import 'package:app/layer/data/source/web/response_movie.dart';

import 'mapper_tmb_api.dart';
import 'package:app/layer/data/source/web/response_page.dart';
import 'package:app/core/request_failed_exception.dart';

class SourceTmdbAPI {
  static const msgTopRatedFailed = "top rated movies loading failed";

  final MapperTmbApi _mapper;
  final String _token;
  final HttpClient _client = HttpClient()
    ..connectionTimeout = const Duration(seconds: 15);

  SourceTmdbAPI(this._mapper, this._token);

  Future<List<ResponseMovie>> loadTopRated(int page) async {
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
    request.headers.add(HttpHeaders.authorizationHeader, _token);

    final response = await request.close();

    if (response.statusCode != HttpStatus.ok) {
      throw RequestFailedException(msgTopRatedFailed, response.statusCode);
    }

    final body = await response.transform(utf8.decoder).join();
    return _mapper.mapTmdbPage(jsonDecode(body) as Map<String, dynamic>).movies;
  }
}
