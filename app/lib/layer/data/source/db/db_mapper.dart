part of 'lib.dart';

class DbMapper {

  Map<String, dynamic> toMap(int seq, RepoMoviesDto from) => {
    DbConst._keyId: from.id,
    DbConst._keyPage: from.page,
    DbConst._keyImgUrl: from.imgUrl,
    DbConst._keyName: from.name,
    DbConst._keyRate: from.rate,
    DbConst._keyOverview: from.overview,
    DbConst._keyDate: from.date?.millisecondsSinceEpoch,
    DbConst._keyFavorite: from.isFavorite.toIntExt(),
    DbConst._keySeq: seq
  };

  RepoMoviesDto toDto(Map<String, dynamic> from) {
    return switch (from) {
      {
        DbConst._keyId: String id,
        DbConst._keyPage: int page,
        DbConst._keyImgUrl: String? imgUrl,
        DbConst._keyName: String? name,
        DbConst._keyRate: num? rate,
        DbConst._keyOverview: String? overview,
        DbConst._keyDate: int? dateMillis,
        DbConst._keyFavorite: int isFavorite,
      } => RepoMoviesDto(
        id,
        imgUrl,
        name,
        rate?.toDouble(),
        overview,
        dateMillis.toDateOrNullExt(EpochUnit.millis),
        isFavorite.toBoolExt(),
        page
      ),
      _ => throw FormatException("Failed to map movie DTO from DB: $from")
    };
  }

}
