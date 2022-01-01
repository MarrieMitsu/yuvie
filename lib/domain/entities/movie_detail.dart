import 'package:equatable/equatable.dart';

import 'genre.dart';

// Movie Detail Entity
class MovieDetailEntity extends Equatable {
  final bool adult;
  final String backdropPath;
  final int budget;
  final List<GenreEntity> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  final String title;
  final String tagline;
  final double voteAverage;
  final int voteCount;

  MovieDetailEntity({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.title,
    required this.tagline,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    budget,
    genres,
    id,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    revenue,
    runtime,
    status,
    title,
    tagline,
    voteAverage,
    voteCount,
  ];
}
