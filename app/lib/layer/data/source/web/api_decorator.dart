part of 'lib.dart';

class ApiDecorator implements SrcMoviesRemote {
  static const _timeoutSec = 15;
  static const _urlScheme = "https";
  static const _urlHost = "api.themoviedb.org";
  static const _urlPathCommon = "3/discover/";

  static const _urlPathMovies = "movie";
  static const _paramIncludeAdult = "include_adult";
  static const _paramIncludeVideo = "include_video";
  static const _paramLang = "language";
  static const _paramPage = "page";

  static const _localEn = "en-US";

  final ApiMapper _mapper;
  final String _token;
  final HttpClient _client = HttpClient()
    ..connectionTimeout = const Duration(seconds: _timeoutSec);

  ApiDecorator(this._mapper, this._token);

  @override
  Future<List<DtoMovie>> readMovies(int pageNum) async {
    final request = await _client.getUrl(
      Uri(
        scheme: _urlScheme,
        host: _urlHost,
        path: _urlPathCommon + _urlPathMovies,
        queryParameters: {
          _paramIncludeAdult: true.toString(),
          _paramIncludeVideo: false.toString(),
          _paramLang: _localEn,
          _paramPage: pageNum.toString(),
        },
      ),
    );
    request.headers.add(HttpHeaders.authorizationHeader, _token);

    final response = await request.close();
    if (response.statusCode != HttpStatus.ok) {
      throw ExceptionRequestFailed(
        "Failed to load top rated movies",
        response.statusCode,
      );
    }

    final body = await response.transform(utf8.decoder).join();
    return _mapper.toMoviesList(body);
  }
}
