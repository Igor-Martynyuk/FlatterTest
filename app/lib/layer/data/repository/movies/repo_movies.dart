import 'package:app/layer/data/repository/movies/repo_dto_movie.dart';

import '../../../domain/use/case/case_fetch_movies.dart';

abstract class SrcMoviesRemote {
  Future<List<RepoDtoMovie>> readMovies(int pageNum);
}

abstract class SrcMoviesLocal {
  Future<int> readMaxPageNum();

  Future<List<RepoDtoMovie>> readMovies(int start, int size);

  Future<void> writeMovies(List<RepoDtoMovie> page);
}

class RepoMovies implements PortFetchMovies {
  final SrcMoviesLocal _localSource;
  final SrcMoviesRemote _remoteSource;

  RepoMovies(this._localSource, this._remoteSource);

  @override
  Future<List<RepoDtoMovie>> getMovies(int start, int size) async {
    final localMovies = await _localSource.readMovies(start, size);

    if (localMovies.length < size) {
      return await fetchMovies(start, size);
    } else {
      return localMovies;
    }
  }

  @override
  Future<List<RepoDtoMovie>> fetchMovies(int start, int size) async {
    final lastPage = await _localSource.readMaxPageNum();
    final remoteMovies = await _remoteSource.readMovies(lastPage + 1);

    await _localSource.writeMovies(remoteMovies);
    return await _localSource.readMovies(start, size);
  }
}
