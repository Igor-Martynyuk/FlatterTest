class Movie {
  static const String _keyName = 'original_title';
  static const String _keyPosterPath = 'poster_path';
  static const String _keyRate = 'popularity';
  static const String _keyDate = 'release_date';
  static const String _keyDescription = 'overview';

  final String name;
  final String posterPath;
  final double rate;
  final DateTime date;
  final String description;

  Movie({
    required this.name,
    required this.posterPath,
    required this.rate,
    required this.date,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        _keyName: String name,
        _keyPosterPath: String posterPath,
        _keyRate: double rate,
        _keyDate: DateTime date,
        _keyDescription: String description,
      } =>
        Movie(
          name: name,
          posterPath: posterPath,
          rate: rate,
          date: date,
          description: description,
        ),
      _ => throw const FormatException("Failed to deserialize response body"),
    };
  }
}
