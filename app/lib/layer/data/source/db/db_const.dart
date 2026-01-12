part of 'lib.dart';

class DbConst {
  static const dbVersion = 1;

  static const String dbName = "movies_db.db";
  static const String tableMovies = "movies";

  static const String _keyId = "id";
  static const String _keyImgUrl = "imgUrl";
  static const String _keyName = "name";
  static const String _keyRate = "rate";
  static const String _keyOverview = "overview";
  static const String _keyDate = "date";
  static const String _keyFavorite = "favorite";
  static const String _keyPage = "page";
  static const String _keySeq = "seq";

  static const scriptInit =
      "CREATE TABLE ${DbConst.tableMovies} ("
      " $_keyId INTEGER PRIMARY KEY,"
      " $_keyImgUrl TEXT,"
      " $_keyName TEXT,"
      " $_keyRate REAL,"
      " $_keyOverview TEXT,"
      " $_keyDate INTEGER,"
      " $_keyFavorite INTEGER NOT NULL DEFAULT 0,"
      " $_keyPage INTEGER NOT NULL,"
      " $_keySeq INTEGER NOT NULL"
      ");";

  static const scriptSetup =
      "CREATE INDEX index_movies_page_seq ON ${DbConst.tableMovies}(${DbConst._keyPage}, ${DbConst._keySeq});";
}
