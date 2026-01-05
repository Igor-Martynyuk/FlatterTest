import 'dart:io';
import 'dart:convert';
import 'package:app/layer/data/repository/movies/dto_movie.dart';
import 'package:app/layer/data/repository/movies/src_movies_read.dart';
import 'package:app/core/request_failed_exception.dart';
import 'mapper_tmb_api.dart';

class ApiTmdb implements SrcMoviesRead{
  static const msgTopRatedFailed = "top rated movies loading failed";

  final MapperTmbApi _mapper;
  final String _token;
  final HttpClient _client = HttpClient()
    ..connectionTimeout = const Duration(seconds: 15);

  ApiTmdb(this._mapper, this._token);

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
      throw RequestFailedException(msgTopRatedFailed, response.statusCode);
    }

    final body = await response.transform(utf8.decoder).join();
    return _mapper.bodyToMovies(body);
  }
}
