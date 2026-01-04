import 'package:app/layer/data/source/tmdb/response/response_tmdb_movie.dart';
import 'package:app/layer/data/source/tmdb/response/response_tmdb_movies.dart';

class MapperTmbApi {
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

  static const String _keyPage = "page";
  static const String _keyResults = "results";

  static const String _failedErrorMsg = "Failed to deserialize response body";
  Exception get failedException => FormatException(_failedErrorMsg);

  ResponseTmdbMovie mapTmdbMovie(Map<String, dynamic> from) {
    return switch (from) {
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
      } => ResponseTmdbMovie(
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
      _ => throw failedException,
    };
  }

  ResponseTmdbMovies mapTmdbMovies(Map<String, dynamic> from) {
    return switch (from) {
      {_keyPage: int page, _keyResults: List results} => ResponseTmdbMovies(
        page: page,
        results: results
            .map((e) => mapTmdbMovie(e as Map<String, dynamic>))
            .toList(),
      ),
      _ => throw failedException,
    };
  }
}
