import 'package:app/layer/data/source/db/db_const.dart';
import 'package:sqflite/sqflite.dart';

class DbDecorator {
  final Database db;
  final DbConst constants;

  DbDecorator(this.db, this.constants);
}
