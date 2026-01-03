import 'package:app/layer/data/source/web/response/response_movie.dart';
import '../../../../../data/source/web/source_tmdb_api.dart';
import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';

class CaseFetchMovies {
  final PortFetchMovies source = SourceTmdbAPI.instance;

  Future<List<ResponseMovie>> invoke() async {
    final response = await source.loadTopRated(1);
    return Future.value(response.results);
  }
}
