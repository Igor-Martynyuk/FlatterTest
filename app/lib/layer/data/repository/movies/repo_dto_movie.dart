class RepoDtoMovie {
  final String id;
  final String? imgUrl;
  final String? name;
  final double? rate;
  final String? overview;
  final DateTime? date;
  final bool isFavorite;
  final int page;

  RepoDtoMovie(
    this.id,
    this.imgUrl,
    this.name,
    this.rate,
    this.overview,
    this.date,
    this.isFavorite,
    this.page,
  );
}
