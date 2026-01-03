import 'package:app/layer/data/source/source_tmdb_api.dart';
import 'package:app/layer/domain/entity/movie.dart';
import 'package:app/layer/domain/use/case/fetch/movies/port_fetch_movies.dart';

class CaseFetchMovies {
  final PortFetchMovies source = SourceTmdbAPI.instance;

  Future<List<Movie>> invoke() async {
    final body = await source.loadTopRated(1);
    return Future.value(
      body.map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList()
    );
  }
}
