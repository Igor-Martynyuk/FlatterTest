import 'package:app/layer/data/repository/movies/dto_movie.dart';
import 'package:app/layer/data/source/tmdb/dto_tmdb_movie.dart';

class MapperMovies {
  DtoMovie mapMovieDto(DtoTmdbMovie tmdbDto) {
    return DtoMovie(
      tmdbDto.id!,
      tmdbDto.posterPath,
      tmdbDto.title,
      tmdbDto.popularity?.toDouble(),
      tmdbDto.overview,
      tmdbDto.releaseDate,
      null,
    );
  }
}
