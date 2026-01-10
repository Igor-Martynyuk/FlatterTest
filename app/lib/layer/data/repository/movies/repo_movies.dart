import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';
import 'package:app/layer/data/repository/movies/dto_movie.dart';

abstract class SrcMoviesRemote {
  Future<List<DtoMovie>> readMovies(int pageNum);
}

abstract class SrcMoviesLocal {
  Future<int> readLastPageNum();
  Future<List<DtoMovie>> readMovies(int start, int size);
  Future<void> writeMovies(List<DtoMovie> page);
}

class RepoMovies implements PortFetchMovies {
  final SrcMoviesLocal _moviesLocal;
  final SrcMoviesRemote _remoteSource;

  RepoMovies(this._moviesLocal, this._remoteSource);

  @override
  Future<List<DtoMovie>> getMovies(int pageNum) async {
    return await _remoteSource.readMovies(pageNum);
  }
}
