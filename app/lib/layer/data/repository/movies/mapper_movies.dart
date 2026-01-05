import 'package:app/layer/data/repository/movies/dto_movie.dart';
import 'package:app/layer/data/repository/movies/dto_page.dart';
import 'package:app/layer/data/source/tmdb/dto_tmdb_movie.dart';
import 'package:app/layer/data/source/tmdb/dto_tmdb_page.dart';
import 'package:flutter/cupertino.dart';

class MapperMovies {
  DtoPage mapPageDto(DtoTmdbPage tmbPage) {
    final movies = List<DtoMovie>.empty(growable: true);

    for (var item in tmbPage.results) {
      try {
        movies.add(mapMovieDto(item));
      } catch (e) {
        debugPrint("Movie processing failed: $item. Reason: $e");
        continue;
      }
    }

    return DtoPage(tmbPage.num, movies);
  }

  DtoMovie mapMovieDto(DtoTmdbMovie tmdbDto) {
    return DtoMovie(
      tmdbDto.id!,
      tmdbDto.posterPath,
      tmdbDto.title,
      tmdbDto.popularity?.toDouble(),
      tmdbDto.overview,
      tmdbDto.releaseDate,
      false,
    );
  }
}
