part of 'main.dart';

Future<DbDecorator> _initMoviesDB() async {
  return DbDecorator(
    await openDatabase(
      join(await getDatabasesPath(), DbConst.dbName),
      onCreate: (db, version) {
        return db.execute(DbConst.initScript);
      },
      version: DbConst.dbVersion,
    ),
  );
}
