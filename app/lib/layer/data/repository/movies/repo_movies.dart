import 'package:app/layer/data/repository/movies/repo_movies_dto.dart';
import 'package:app/layer/data/repository/movies/repo_movies_mapper.dart';
import 'package:app/layer/domain/entity/movie.dart';

import '../../../domain/use/case_fetch_movies.dart';

abstract class SrcMoviesRemote {
  Future<List<RepoMoviesDto>> readMovies(int pageNum);
}

abstract class SrcMoviesLocal {
  Future<int> readMaxPageNum();

  Future<List<RepoMoviesDto>> readMovies(int start, int size);

  Future<void> writeMovies(List<RepoMoviesDto> page);
}

class RepoMovies implements PortFetchMovies {
  final SrcMoviesLocal _localSource;
  final SrcMoviesRemote _remoteSource;
  final RepoMoviesMapper _mapper;

  RepoMovies(this._localSource, this._remoteSource, this._mapper);

  Future<List<RepoMoviesDto>> fetchMoviesDto(int start, int size) async {
    final lastPage = await _localSource.readMaxPageNum();
    final remoteMovies = await _remoteSource.readMovies(lastPage + 1);

    await _localSource.writeMovies(remoteMovies);
    return await _localSource.readMovies(start, size);
  }

  @override
  Future<List<Movie>> fetchMovies(int start, int size) async =>
      (await fetchMoviesDto(start, size)).map(_mapper.toMovie).toList();

  @override
  Future<List<Movie>> getMovies(int start, int size) async {
    final localMovies = await _localSource.readMovies(start, size);

    if (localMovies.length < size) {
      return (await fetchMoviesDto(start, size)).map(_mapper.toMovie).toList();
    } else {
      return localMovies.map(_mapper.toMovie).toList();
    }
  }
}
