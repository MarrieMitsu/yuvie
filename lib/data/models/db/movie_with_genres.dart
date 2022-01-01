part of '../../services/db/database.dart';

// MovieWithGenreCompanion
class MovieWithGenreCompanion extends Equatable {
  final MoviesCompanion movie;
  final List<GenresCompanion> genres;

  MovieWithGenreCompanion(this.movie, this.genres);

  @override
  List<Object?> get props => [movie, genres];

}

// MovieWithGenre
class MovieWithGenre extends Equatable {
  final Movie movie;
  final List<Genre> genres;

  MovieWithGenre(this.movie, this.genres);

  @override
  List<Object?> get props => [movie, genres];
}

// this extension class located at 'database.g.dart'
extension MovieEntityMapper on MovieWithGenre {
  // toMovieEntity
  MovieEntity toMovieEntity() {
    return MovieEntity(
      posterPath: movie.posterPath!, 
      overview: movie.overview!, 
      releaseDate: movie.releaseDate!, 
      id: movie.id, 
      title: movie.title!, 
      backdropPath: movie.backdropPath!, 
      voteAverage: movie.voteAverage!,
    );
  }

  // toMovieDetailEntity
  MovieDetailEntity toMovieDetailEntity() {
    return MovieDetailEntity(
      adult: movie.adult!, 
      backdropPath: movie.backdropPath!, 
      budget: movie.budget!, 
      genres: genres.map((e) => e.toEntity()).toList(), 
      id: movie.id, 
      originalLanguage: movie.originalLanguage!, 
      originalTitle: movie.originalTitle!, 
      overview: movie.overview!, 
      popularity: movie.popularity!, 
      posterPath: movie.posterPath!, 
      releaseDate: movie.releaseDate!, 
      revenue: movie.revenue!, 
      runtime: movie.runtime!, 
      status: movie.status!, 
      title: movie.title!, 
      tagline: movie.tagline!, 
      voteAverage: movie.voteAverage!, 
      voteCount: movie.voteCount!,
    );
  }
}