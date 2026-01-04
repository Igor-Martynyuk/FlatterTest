class DtoMovie {
  final int id;
  final String? posterUrl;
  final String? title;
  final double? rate;
  final String? overview;
  final String? releaseDate;
  final bool? isFavorite;

  DtoMovie(
    this.id,
    this.posterUrl,
    this.title,
    this.rate,
    this.overview,
    this.releaseDate,
    this.isFavorite,
  );
}
