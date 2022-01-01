import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yuvie/domain/entities/pagination.dart';

import '../../../domain/entities/movie.dart';

part 'search_movie_api_model.g.dart';

// Search Movie Api Model
@JsonSerializable(explicitToJson: true)
class SearchMovieApiModel extends Equatable {

  final int page;

  final List<MovieModel> results;

  @JsonKey(name: 'total_results')
  final int totalResults;

  @JsonKey(name: 'total_pages')
  final int totalPages;


  SearchMovieApiModel({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  @override
  List<Object?> get props => [
    page,
    results,
    totalResults,
    totalPages,
  ];

  // fromJson
  factory SearchMovieApiModel.fromJson(Map<String, dynamic> json) => _$SearchMovieApiModelFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$SearchMovieApiModelToJson(this);

}

extension SearchMovieApiModelPaginationMapper on SearchMovieApiModel {
  PaginationEntity toEntity() {
    return PaginationEntity(
      page: page, 
      totalResults: totalResults, 
      totalPages: totalPages
    );
  }
}

// Movie Model
@JsonSerializable()
class MovieModel extends Equatable {
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  final bool adult;

  final String overview;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;

  final int id;

  @JsonKey(name: 'original_title')
  final String originalTitle;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  final String title;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  final double popularity;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  final bool video;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  MovieModel({
    this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
    posterPath,
    adult,
    overview,
    releaseDate,
    genreIds,
    id,
    originalTitle,
    originalLanguage,
    title,
    backdropPath,
    popularity,
    voteCount,
    video,
    voteAverage,
  ];

  // fromJson
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

}

extension MovieEntityMapper on MovieModel {
  MovieEntity toEntity() {
    return MovieEntity(
      posterPath: posterPath ?? '', 
      overview: overview, 
      releaseDate: releaseDate, 
      id: id, 
      title: title, 
      backdropPath: backdropPath ?? '', 
      voteAverage: voteAverage
    );
  }
}
