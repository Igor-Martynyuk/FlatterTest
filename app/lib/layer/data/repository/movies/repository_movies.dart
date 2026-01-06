import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';
import 'package:app/layer/data/repository/movies/dto_movie.dart';

abstract class SrcMoviesRead {
  Future<List<DtoMovie>> readMovies(int pageNum);
}

abstract class SrcMoviesWrite implements SrcMoviesRead {
  Future<void> writeMovies(List<DtoMovie> movies);
}

class RepositoryMovies implements PortFetchMovies {
  final SrcMoviesRead _remoteSource;

  RepositoryMovies(this._remoteSource);

  @override
  Future<List<DtoMovie>> getMovies(int page) => _remoteSource.readMovies(page);
}
