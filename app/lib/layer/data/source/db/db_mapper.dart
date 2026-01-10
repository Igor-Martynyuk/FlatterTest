import 'package:app/core/extensions/ext_bool.dart';
import 'package:app/core/extensions/ext_int.dart';
import 'package:app/core/extensions/ext_int_nullable.dart';
import 'package:app/layer/data/repository/movies/dto_movie.dart';
import 'package:app/layer/data/source/db/db_const.dart';

class DbMapper {

  Map<String, dynamic> toMap(DtoMovie from) => {
    DbConst.keyId: from.id,
    DbConst.keyPage: from.page,
    DbConst.keyImgUrl: from.imgUrl,
    DbConst.keyName: from.name,
    DbConst.keyRate: from.rate,
    DbConst.keyOverview: from.overview,
    DbConst.keyDate: from.date?.millisecondsSinceEpoch,
    DbConst.keyIsFavorite: from.isFavorite.toIntExt(),
  };

  DtoMovie toDto(Map<String, dynamic> from) {
    return switch (from) {
      {
        DbConst.keyId: int id,
        DbConst.keyPage: int page,
        DbConst.keyImgUrl: String? imgUrl,
        DbConst.keyName: String? name,
        DbConst.keyRate: num? rate,
        DbConst.keyOverview: String? overview,
        DbConst.keyDate: int? dateMillis,
        DbConst.keyIsFavorite: int isFavorite,
      } => DtoMovie(
        id,
        page,
        imgUrl,
        name,
        rate?.toDouble(),
        overview,
        dateMillis.toDateOrNullExt(EpochUnit.millis),
        isFavorite.toBoolExt(),
      ),
      _ => throw FormatException("Failed to map movie DTO from DB: $from")
    };
  }

}
