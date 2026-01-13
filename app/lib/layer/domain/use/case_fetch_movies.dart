import 'package:app/layer/domain/entity/movie.dart';
import 'package:app/layer/domain/use/use_case.dart';

abstract class PortFetchMovies {
  Future<List<Movie>> getMovies(int start, int size);

  Future<List<Movie>> fetchMovies(int start, int size);
}

class ArgsFetchMovies {
  final int pageNum;
  final int pageSize;
  final bool forceUpdate;

  ArgsFetchMovies(this.pageNum, this.pageSize, this.forceUpdate);
}

class CaseFetchMovies implements UseCase<ArgsFetchMovies, Future<List<Movie>>> {
  final PortFetchMovies port;

  CaseFetchMovies(this.port);

  @override
  Future<List<Movie>> execute(ArgsFetchMovies args) async {
    final int start = args.pageNum * args.pageSize;

    if (args.forceUpdate) {
      return await port.fetchMovies(start, args.pageSize);
    } else {
      return await port.getMovies(start, args.pageSize);
    }
  }
}
