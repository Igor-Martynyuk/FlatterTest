class DtoMovie {
  final int id;
  final int pageNum;
  final String? posterUrl;
  final String? title;
  final double? rate;
  final String? overview;
  final DateTime? releaseDate;
  final bool isFavorite;

  DtoMovie(
    this.id,
    this.pageNum,
    this.posterUrl,
    this.title,
    this.rate,
    this.overview,
    this.releaseDate,
    this.isFavorite,
  );
}
