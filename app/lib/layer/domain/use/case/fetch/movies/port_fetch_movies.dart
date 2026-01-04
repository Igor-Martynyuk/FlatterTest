import 'package:app/layer/data/repository/movies/dto_movie.dart';

abstract class PortFetchMovies {
  Future<List<DtoMovie>> loadTopRated(int page);
}
