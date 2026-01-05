import 'dart:convert';

import 'package:app/layer/data/repository/movies/dto_movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/layer/data/source/web/response_movie.dart';
import 'package:app/layer/data/source/web/response_page.dart';

class MapperTmbApi {
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

  static const String _failedErrorMsg = "Failed to deserialize response body";
  final Exception _failedException = FormatException(_failedErrorMsg);

  List<DtoMovie> bodyToMovies(String bodyStr) {
    final json = jsonDecode(bodyStr) as Map<String, dynamic>;
    return _parsePageResponse(json).movies.map(_mapResponseToDto).toList();
  }

  DtoMovie _mapResponseToDto(ResponseMovie response) {
    return DtoMovie(
      response.id,
      response.posterPath,
      response.title,
      response.popularity?.toDouble(),
      response.overview,
      response.releaseDate,
      false,
    );
  }

  ResponsePage _parsePageResponse(Map<String, dynamic> json) {
    return switch (json) {
      {_keyPage: int page, _keyResults: List results} => ResponsePage(
        num: page,
        movies: _parseMovieResponseList(results),
      ),
      _ => throw _failedException,
    };
  }

  List<ResponseMovie> _parseMovieResponseList(List from) {
    final result = List<ResponseMovie>.empty(growable: true);

    for (Map<String, dynamic> item in from) {
      try {
        result.add(_parseMovieResponse(item));
      } catch (e) {
        debugPrint("Movie response deserialization failed: $item. Reason: $e");
        continue;
      }
    }

    return result;
  }

  ResponseMovie _parseMovieResponse(Map<String, dynamic> json) {
    return switch (json) {
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
      } => ResponseMovie(
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
}
