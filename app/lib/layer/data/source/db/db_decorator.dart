part of 'lib.dart';

class DbDecorator extends SrcMoviesLocal {
  final Database db;

  DbDecorator(this.db);

  @override
  Future<int> readLastPageNum() {
    // TODO: implement readLastPageNum
    throw UnimplementedError();
  }

  @override
  Future<List<DtoMovie>> readMovies(int start, int size) {
    // TODO: implement readMovies
    throw UnimplementedError();
  }

  @override
  Future<void> writeMovies(List<DtoMovie> page) {
    // TODO: implement writeMovies
    throw UnimplementedError();
  }
}
