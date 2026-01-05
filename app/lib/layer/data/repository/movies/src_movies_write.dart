import 'package:app/layer/data/repository/movies/dto_movie.dart';
import 'package:app/layer/data/repository/movies/src_movies_read.dart';

abstract class SrcMoviesWrite implements SrcMoviesRead {
  Future<void> writeMovies(List<DtoMovie> movies);
}
