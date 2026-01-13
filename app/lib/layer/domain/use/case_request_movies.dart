import 'package:app/layer/domain/entity/movie.dart';
import 'package:app/layer/domain/use/use_case.dart';

abstract class FacadeRequestMovies {
  Future<List<Movie>> getMovies(int start, int size);
  Future<List<Movie>> fetchMovies(int start, int size);
}

class ArgsRequestMovies {
  final int pageNum;
  final int pageSize;
  final bool forceUpdate;

  ArgsRequestMovies(this.pageNum, this.pageSize, this.forceUpdate);
}

class CaseRequestMovies implements UseCase<ArgsRequestMovies, List<Movie>> {
  final FacadeRequestMovies port;

  CaseRequestMovies(this.port);

  @override
  Future<List<Movie>> execute(ArgsRequestMovies args) async {
    final int start = args.pageNum * args.pageSize;

    if (args.forceUpdate) {
      return await port.fetchMovies(start, args.pageSize);
    } else {
      return await port.getMovies(start, args.pageSize);
    }
  }
}
