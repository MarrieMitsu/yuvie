import 'package:dartz/dartz.dart';

import '../../domain/entities/genre.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/entities/pagination.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../utils/exceptions.dart';
import '../models/api/movies_get_details_api_model.dart';
import '../models/api/search_movie_api_model.dart';
import '../services/api/api.dart';
import '../services/db/database.dart';

// implementation
class MovieRepositoryImpl implements MovieRepository {
  final SearchApi searchApi;
  final MoviesApi moviesApi;

  final Database db;
  
  MovieRepositoryImpl({
    required this.searchApi,
    required this.moviesApi,
    required this.db,
  });

  @override
  Future<Either<Error, Tuple2<PaginationEntity, List<MovieEntity>>>> searchRemoteMovies(Map<String, dynamic>? qp) async {
    try {
      final searchMovies = await searchApi.searchMovies(qp);
      final pagination = searchMovies.toEntity();
      final results = searchMovies.results
        .map((e) => e.toEntity())
        .toList();

      return Right(Tuple2(pagination, results));
    } on ServerException {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, MovieDetailEntity>> getDetailRemoteMovie(int movieId, Map<String, dynamic>? qp) async {
    try {
      final result = await moviesApi.getDetails(movieId, qp);
      final movieDetail = result.toEntity();

      return Right(movieDetail);
    } on ServerException {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, List<GenreEntity>>> getAllLocalGenre() async {
    try {
      final result = await db.getAllGenre();
      final genres = result
        .map((e) => e.toEntity())
        .toList();
        
      return Right(genres);
    } on ServerException {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, Tuple2<PaginationEntity, List<MovieEntity>>>> getAllLocalMovie(int page) async {
    try {
      final int limit = 10;
      
      final count = await db.countMovies();
      final result = await db.getAllMovieWithGenre(
        page: page,
        limit: limit,
      );
      final movies = result.map((e) => e.toMovieEntity()).toList();

      final pagination = PaginationEntity(
        page: page, 
        totalResults: count, 
        totalPages: count ~/ limit 
      );

      return Right(Tuple2(pagination, movies));
    } on ServerException {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, MovieDetailEntity>> getDetailLocalMovie(int movieId) async {
    try {
      final result = await db.getMovieWithGenre(movieId);

      return Right(result.toMovieDetailEntity());
    } on ServerException {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, MovieEntity>> addLocalMovie(MovieWithGenreCompanion entry) async {
    try {
      final result = await db.insertMovie(entry);

      return Right(result.toMovieEntity());
    } on ServerException {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, Tuple2<MovieEntity, MovieDetailEntity>>> editLocalMovie(MovieWithGenreCompanion entry) async {
    try {
      final result = await db.updateMovie(entry);

      return Right(Tuple2(
        result.toMovieEntity(), result.toMovieDetailEntity()
      ));
    } on ServerException {
      return Left(Error());
    }
  }

  @override
  Future<Either<Error, bool>> deleteLocalMovie(int movieId) async {
    try {
      final result = await db.deleteMovie(movieId);

      return Right(result);
    } on ServerException {
      return Left(Error());
    }
  }

}