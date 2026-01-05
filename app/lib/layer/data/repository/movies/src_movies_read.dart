import 'dto_movie.dart';

abstract class SrcMoviesRead {
  Future<List<DtoMovie>> readMovies(int pageNum);
}