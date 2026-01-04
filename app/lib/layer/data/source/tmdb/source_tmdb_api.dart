import 'dart:convert';
import 'dart:io';

import 'package:app/layer/data/source/tmdb/mapper_tmb_api.dart';
import 'package:app/layer/data/source/tmdb/response/response_tmdb_movies.dart';

import '../../../domain/use/case/fetch/movies/port_fetch_movies.dart';

class SourceTmdbAPI implements PortFetchMovies {
  final MapperTmbApi _mapper;

  final String _token;
  final HttpClient _client = HttpClient()
    ..connectionTimeout = const Duration(seconds: 15);

  SourceTmdbAPI(this._mapper, this._token);

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
    request.headers.add(HttpHeaders.authorizationHeader, _token);

    final response = await request.close();
    final body = await response.transform(utf8.decoder).join();

    return _mapper.mapTmdbMovies(jsonDecode(body) as Map<String, dynamic>);
  }
}
