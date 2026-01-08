class DtoMovie {
  final int id;
  final int page;
  final String? imgUrl;
  final String? name;
  final double? rate;
  final String? overview;
  final DateTime? date;
  final bool isFavorite;

  DtoMovie(
    this.id,
    this.page,
    this.imgUrl,
    this.name,
    this.rate,
    this.overview,
    this.date,
    this.isFavorite,
  );
}
