import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';
import 'package:app/layer/data/repository/movies/dto_movie.dart';

abstract class SourceReadOnlyMovies {
  Future<List<DtoMovie>> getMovies(int pageNum);
}

class RepositoryMovies implements PortFetchMovies {
  final SourceReadOnlyMovies _remoteSource;

  RepositoryMovies(this._remoteSource);

  @override
  Future<List<DtoMovie>> getMovies(int page) => _remoteSource.getMovies(page);
}
