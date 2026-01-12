part of 'main.dart';

Future<DbDecorator> createDb() async {
  return DbDecorator(
    await openDatabase(
      join(await getDatabasesPath(), DbConst.dbName),
      onCreate: (db, version) async {
        await db.execute(DbConst.scriptInit);
        await db.execute(DbConst.scriptSetup);
      },
      version: DbConst.dbVersion,
    ),
    DbMapper(),
  );
}
