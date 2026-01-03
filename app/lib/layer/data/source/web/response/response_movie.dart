class ResponseMovie {
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

  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final num popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;

  ResponseMovie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory ResponseMovie.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        _keyAdult: bool adult,
        _keyBackdropPath: String? backdropPath,
        _keyGenreIds: List genreIds,
        _keyId: int id,
        _keyOriginalLanguage: String originalLanguage,
        _keyOriginalTitle: String originalTitle,
        _keyOverview: String overview,
        _keyPopularity: num popularity,
        _keyPosterPath: String? posterPath,
        _keyReleaseDate: String releaseDate,
        _keyTitle: String title,
        _keyVideo: bool video,
        _keyVoteAverage: num voteAverage,
        _keyVoteCount: int voteCount,
      } =>
        ResponseMovie(
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds.cast<int>(),
          id: id,
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
      _ => throw const FormatException("Failed to deserialize response body"),
    };
  }
}
