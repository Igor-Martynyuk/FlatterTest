part of 'main.dart';

const _moviesDbName = "movies_db.db";
const _moviesDbVersion = 1;
const _scriptCreateTable = "CREATE TABLE ${DbConst.moviesTableName} ("
  " ${DbConst.keyId} INTEGER PRIMARY KEY,"
  " ${DbConst.keyImgUrl} TEXT,"
  " ${DbConst.keyName} TEXT,"
  " ${DbConst.keyRate} REAL,"
  " ${DbConst.keyOverview} TEXT,"
  " ${DbConst.keyDate} INTEGER,"
  " ${DbConst.keyFavorite} INTEGER NOT NULL DEFAULT 0"
  ");";

Future<Database> _initMoviesDB() async {
  debugPrint(_scriptCreateTable);

  return await openDatabase(
    join(await getDatabasesPath(), _moviesDbName),
    onCreate: (db, version) {
      return db.execute(_scriptCreateTable);
    },
    version: _moviesDbVersion,
  );
}
