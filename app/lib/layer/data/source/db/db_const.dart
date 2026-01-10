part of 'lib.dart';

class DbConst {
  static const dbVersion = 1;

  static const String dbName = "movies_db.db";
  static const String moviesTableName = "movies";

  static const String _keyId = "id";
  static const String _keyPage = "page";
  static const String _keyImgUrl = "imgUrl";
  static const String _keyName = "name";
  static const String _keyRate = "rate";
  static const String _keyOverview = "overview";
  static const String _keyDate = "date";
  static const String _keyFavorite = "favorite";

  static const initScript = "CREATE TABLE ${DbConst.moviesTableName} ("
    " $_keyId INTEGER PRIMARY KEY,"
    " $_keyImgUrl TEXT,"
    " $_keyName TEXT,"
    " $_keyRate REAL,"
    " $_keyOverview TEXT,"
    " $_keyDate INTEGER,"
    " $_keyFavorite INTEGER NOT NULL DEFAULT 0"
    ");";

}
