import 'package:dartz/dartz.dart';

import '../../data/services/db/database.dart';
import '../entities/genre.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';
import '../entities/pagination.dart';

// abstract
abstract class MovieRepository {
  Future<Either<Error, Tuple2<PaginationEntity, List<MovieEntity>>>> searchRemoteMovies(Map<String, dynamic>? qp);
  Future<Either<Error, MovieDetailEntity>> getDetailRemoteMovie(int movieId, Map<String, dynamic>? qp);
  
  Future<Either<Error, List<GenreEntity>>> getAllLocalGenre();
  Future<Either<Error, Tuple2<PaginationEntity, List<MovieEntity>>>> getAllLocalMovie(int page);
  Future<Either<Error, MovieDetailEntity>> getDetailLocalMovie(int movieId);
  Future<Either<Error, MovieEntity>> addLocalMovie(
      MovieWithGenreCompanion entry);
  Future<Either<Error, Tuple2<MovieEntity, MovieDetailEntity>>> editLocalMovie(
      MovieWithGenreCompanion entry);
  Future<Either<Error, bool>> deleteLocalMovie(int movieId);
}