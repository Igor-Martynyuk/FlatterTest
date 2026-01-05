import 'package:flutter/cupertino.dart';
import 'package:app/layer/data/repository/movies/dto_movie.dart';
import 'package:app/layer/data/repository/movies/dto_page.dart';
import '../../source/web/response_movie.dart';
import '../../source/web/response_page.dart';

class MapperMovies {
  DtoMovie mapMovieDto(ResponseMovie tmdbDto) {
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
