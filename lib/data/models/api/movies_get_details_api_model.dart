import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/genre.dart';
import '../../../domain/entities/movie_detail.dart';

part 'movies_get_details_api_model.g.dart';

// MoviesGetDetailsApiModel
@JsonSerializable(explicitToJson: true)
class MoviesGetDetailsApiModel extends Equatable {

  final bool adult;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  
  final int budget;

  final List<GenreModel> genres;

  final int id;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  @JsonKey(name: 'original_title')
  final String originalTitle;

  final String overview;

  final double popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  final int revenue;

  final int runtime;

  final String status;

  final String title;

  final String tagline;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  MoviesGetDetailsApiModel({
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

  // fromJson
  factory MoviesGetDetailsApiModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesGetDetailsApiModelFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$MoviesGetDetailsApiModelToJson(this);

}

extension MovieDetailEntityMapper on MoviesGetDetailsApiModel {
  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
      adult: adult, 
      backdropPath: backdropPath ?? '', 
      budget: budget, 
      genres: genres.map((e) => e.toEntity()).toList(), 
      id: id, 
      originalLanguage: originalLanguage, 
      originalTitle: originalTitle, 
      overview: overview, 
      popularity: popularity, 
      posterPath: posterPath ?? '', 
      releaseDate: releaseDate, 
      revenue: revenue, 
      runtime: runtime, 
      status: status, 
      title: title, 
      tagline: tagline, 
      voteAverage: voteAverage, 
      voteCount: voteCount,
    );
  }
}

// Genre
@JsonSerializable()
class GenreModel extends Equatable {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
    id,
    name,
  ];

  // fromJson
  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$GenreModelToJson(this);

  // toEntity

}

extension GenreEntityMapper on GenreModel {
  GenreEntity toEntity() {
    return GenreEntity(
      id: id, 
      name: name,
    );
  }
}