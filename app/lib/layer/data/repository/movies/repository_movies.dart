import 'package:app/layer/data/repository/movies/src_movies_read.dart';
import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';
import 'package:app/layer/data/repository/movies/dto_movie.dart';

class RepositoryMovies implements PortFetchMovies {
  final SrcMoviesRead _remoteSource;

  RepositoryMovies(this._remoteSource);

  @override
  Future<List<DtoMovie>> getMovies(int page) => _remoteSource.readMovies(page);
}
