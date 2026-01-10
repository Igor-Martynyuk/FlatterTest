import 'dart:io';
import 'dart:convert';
import 'package:app/core/exception/exception_request_failed.dart';
import 'package:app/layer/data/repository/movies/dto_movie.dart';
import '../../repository/movies/repo_movies.dart';
import 'api_mapper.dart';

class ApiDecorator implements SrcMoviesRead {
  static const timeoutSec = 15;
  static const msgTopRatedFailed = "top rated movies loading failed";

  final ApiMapper _mapper;
  final String _token;
  final HttpClient _client = HttpClient()
    ..connectionTimeout = const Duration(seconds: timeoutSec);

  ApiDecorator(this._mapper, this._token);

  @override
  Future<List<DtoMovie>> readMovies(int pageNum) async {
    final url = Uri(
      scheme: "https",
      host: "api.themoviedb.org",
      path: "3/discover/movie",
      queryParameters: {
        "include_adult": "true",
        "include_video": "false",
        "language": "en-US",
        "page": pageNum.toString(),
      },
    );

    final request = await _client.getUrl(url);
    request.headers.add(HttpHeaders.authorizationHeader, _token);

    final response = await request.close();

    if (response.statusCode != HttpStatus.ok) {
      throw ExceptionRequestFailed(msgTopRatedFailed, response.statusCode);
    }

    final body = await response.transform(utf8.decoder).join();
    return _mapper.toMoviesList(body);
  }
}
