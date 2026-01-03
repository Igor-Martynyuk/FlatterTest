import 'package:app/layer/data/source/web/response/response_movies.dart';

abstract class PortFetchMovies {
  Future<ResponseMovies> loadTopRated(int page);
}
