import 'package:equatable/equatable.dart';

// Movie Entity
class MovieEntity extends Equatable {
  final int id;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final String title;
  final String backdropPath;
  final double voteAverage;

  MovieEntity({
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
    posterPath, 
    overview,
    releaseDate,
    id,
    title,
    backdropPath,
    voteAverage,
  ];

}