import 'dart:convert';
import 'dart:io';

import 'package:app/layer/data/source/tmdb/mapper_tmb_api.dart';
import 'package:app/layer/data/source/tmdb/response/response_tmdb_movies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../domain/use/case/fetch/movies/port_fetch_movies.dart';

class SourceTmdbAPI implements PortFetchMovies {
  static final SourceTmdbAPI instance = SourceTmdbAPI._();
  static final _envToken = 'TMB_ACCESS_TOKEN';

  final token = "Bearer ${dotenv.env[_envToken]}";
  final mapper = MapperTmbApi();

  final HttpClient _client = HttpClient()
    ..connectionTimeout = const Duration(seconds: 15);

  SourceTmdbAPI._();

  @override
  Future<ResponseTmdbMovies> loadTopRated(int page) async {
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
    request.headers.add(HttpHeaders.authorizationHeader, token);

    final response = await request.close();
    final body = await response.transform(utf8.decoder).join();

    return mapper.mapTmdbMovies(jsonDecode(body) as Map<String, dynamic>);
  }
}
