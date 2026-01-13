part of 'lib.dart';

class ApiMapper {
  static const String _keyPage = "page";
  static const String _keyResults = "results";

  static const String _keyAdult = "adult";
  static const String _keyBackdropPath = "backdrop_path";
  static const String _keyGenreIds = "genre_ids";
  static const String _keyId = "id";
  static const String _keyOriginalLanguage = "original_language";
  static const String _keyOriginalTitle = "original_title";
  static const String _keyOverview = "overview";
  static const String _keyPopularity = "popularity";
  static const String _keyPosterPath = "poster_path";
  static const String _keyReleaseDate = "release_date";
  static const String _keyTitle = "title";
  static const String _keyVideo = "video";
  static const String _keyVoteAverage = "vote_average";
  static const String _keyVoteCount = "vote_count";

  static const String _msgParseFailed = "Failed to parse a map";

  List<RepoMoviesDto> toMoviesList(String from) {
    final json = jsonDecode(from) as Map<String, dynamic>;
    final pageResponse = _toPageResponse(json);

    return pageResponse.movies
        .map((i) => _toMovieDto(i, pageResponse.num))
        .toList();
  }

  RepoMoviesDto _toMovieDto(ApiResponseMovie from, int pageNum) {
    return RepoMoviesDto(
      from.id,
      from.posterPath,
      from.title,
      from.popularity?.toDouble(),
      from.overview,
      DateTime.tryParse(from.releaseDate!),
      false,
      pageNum
    );
  }

  ApiResponsePage _toPageResponse(Map<String, dynamic> from) {
    return switch (from) {
      {_keyPage: int page, _keyResults: List results} => ApiResponsePage(
        page,
        results
            .map((i) => i as Map<String, dynamic>)
            .mapOrSkipExt(_toMovieResponse)
            .toList(),
      ),
      _ => throw FormatException("$_msgParseFailed: $from"),
    };
  }

  ApiResponseMovie _toMovieResponse(Map<String, dynamic> from) {
    return switch (from) {
      {
        _keyAdult: bool adult,
        _keyBackdropPath: String? backdropPath,
        _keyGenreIds: List genreIds,
        _keyId: int id,
        _keyOriginalLanguage: String originalLanguage,
        _keyOriginalTitle: String originalTitle,
        _keyOverview: String overview,
        _keyPopularity: double popularity,
        _keyPosterPath: String? posterPath,
        _keyReleaseDate: String releaseDate,
        _keyTitle: String title,
        _keyVideo: bool video,
        _keyVoteAverage: double voteAverage,
        _keyVoteCount: int voteCount,
      } => ApiResponseMovie(
        adult: adult,
        backdropPath: backdropPath,
        genreIds: genreIds.cast<int>(),
        id: id.toString(),
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      ),
      _ => throw FormatException("$_msgParseFailed: $from"),
    };
  }
}
