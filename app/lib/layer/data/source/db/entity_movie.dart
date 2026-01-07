
class EntityMovie {
  final int id;
  final String? posterUrl;
  final String? title;
  final double? rate;
  final String? overview;
  final int? releaseDate;
  final bool isFavorite;

  EntityMovie(
    this.id,
    this.posterUrl,
    this.title,
    this.rate,
    this.overview,
    this.releaseDate,
    this.isFavorite
  );
}
