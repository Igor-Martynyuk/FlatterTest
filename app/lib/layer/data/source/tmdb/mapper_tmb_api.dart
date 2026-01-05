import 'package:flutter/cupertino.dart';

import 'dto_tmdb_movie.dart';
import 'dto_tmdb_page.dart';

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
  final Exception _failedException = FormatException(_failedErrorMsg);

  DtoTmdbMovie _mapTmdbMovie(Map<String, dynamic> from) {
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
      } =>
        DtoTmdbMovie(
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
      _ => throw _failedException,
    };
  }

  List<DtoTmdbMovie> _mapTmdbMovies(List from) {
    final result = List<DtoTmdbMovie>.empty(growable: true);

    for (Map<String, dynamic> item in from) {
      try {
        result.add(_mapTmdbMovie(item));
      } catch (e) {
        debugPrint("Movie response deserialization failed: $item. Reason: $e");
        continue;
      }
    }

    return result;
  }

  DtoTmdbPage mapTmdbPage(Map<String, dynamic> from) {
    return switch (from) {
      {_keyPage: int page, _keyResults: List results} => DtoTmdbPage(
        num: page,
        results: _mapTmdbMovies(results),
      ),
      _ => throw _failedException,
    };
  }
}
