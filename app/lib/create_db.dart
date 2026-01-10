part of 'main.dart';

Future<Database> _initMoviesDB() async {
  return await openDatabase(
    join(await getDatabasesPath(), DbConst.dbName),
    onCreate: (db, version) {
      return db.execute(DbConst.initScript);
    },
    version: DbConst.dbVersion,
  );
}
