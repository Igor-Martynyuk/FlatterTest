import 'package:app/layer/data/repository/movies/repo_movies_dto.dart';
import 'package:app/layer/domain/entity/movie.dart';

class RepoMoviesMapper {
  Movie toMovie(RepoMoviesDto from) => Movie(
    from.id,
    from.name,
    from.imgUrl,
    from.rate,
    from.date,
    from.overview,
  );
}
