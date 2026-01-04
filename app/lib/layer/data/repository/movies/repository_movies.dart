import 'package:app/layer/data/repository/movies/dto_movie.dart';
import 'package:app/layer/data/repository/movies/mapper_movies.dart';
import 'package:app/layer/data/source/tmdb/source_tmdb_api.dart';
import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';
import 'package:flutter/cupertino.dart';

class RepositoryMovies implements PortFetchMovies {
  final SourceTmdbAPI _remoteSource;
  final MapperMovies _mapper;

  RepositoryMovies(this._remoteSource, this._mapper);

  @override
  Future<List<DtoMovie>> loadTopRated(int page) async {
    final remoteData = await _remoteSource.loadTopRated(page);
    final result = List<DtoMovie>.empty(growable: true);

    for (var item in remoteData.results) {
      try {
        result.add(_mapper.mapMovieDto(item));
      } catch (e) {
        debugPrint("Movie processing failed: $item. Reason: $e");
        continue;
      }
    }

    return result;
  }
}
