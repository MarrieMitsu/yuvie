// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_get_details_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesGetDetailsApiModel _$MoviesGetDetailsApiModelFromJson(
        Map<String, dynamic> json) =>
    MoviesGetDetailsApiModel(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      budget: json['budget'] as int,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String,
      revenue: json['revenue'] as int,
      runtime: json['runtime'] as int,
      status: json['status'] as String,
      title: json['title'] as String,
      tagline: json['tagline'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$MoviesGetDetailsApiModelToJson(
        MoviesGetDetailsApiModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'title': instance.title,
      'tagline': instance.tagline,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

GenreModel _$GenreModelFromJson(Map<String, dynamic> json) => GenreModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreModelToJson(GenreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
