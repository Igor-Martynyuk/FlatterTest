part of 'lib.dart';

class DbDecorator extends SrcMoviesLocal {
  final Database _database;
  final DbMapper _mapper;

  DbDecorator(this._database, this._mapper);

  @override
  Future<int> readMaxPageNum() async {
    final result = await _database.rawQuery(
      'SELECT MAX(${DbConst._keyPage}) AS ${DbConst._keyPage} FROM ${DbConst.tableMovies}',
    );

    final value = result.first[DbConst._keyPage];
    return (value as int?) ?? 0;
  }

  @override
  Future<List<DtoMovie>> readMovies(int start, int size) async {
    final result = await _database.query(
      DbConst.tableMovies,
      orderBy: '${DbConst._keyPage} ASC, ${DbConst._keySeq} ASC',
      limit: size,
      offset: start,
    );

    return result.map(_mapper.toDto).toList();
  }

  @override
  Future<void> writeMovies(List<DtoMovie> page) async {
    final batch = _database.batch();

    int seq = 0;
    for (final movie in page) {
      batch.insert(
        DbConst.tableMovies,
        _mapper.toMap(seq++, movie),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }

    await batch.commit(noResult: true);
  }
}
