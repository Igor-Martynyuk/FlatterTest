import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';
import 'package:app/layer/data/repository/movies/dto_movie.dart';
import 'package:app/layer/data/repository/movies/mapper_movies.dart';
import '../../source/web/source_tmdb_api.dart';

class RepositoryMovies implements PortFetchMovies {
  final SourceTmdbAPI _remoteSource;
  final MapperMovies _mapper;

  RepositoryMovies(this._remoteSource, this._mapper);

  @override
  Future<List<DtoMovie>> loadTopRated(int page) async {
    final remoteData = await _remoteSource.loadTopRated(page);
    return _mapper.mapPageDto(remoteData).movies;
  }
}
