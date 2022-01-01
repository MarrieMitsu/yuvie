import 'package:dartz/dartz.dart';

import '../../entities/movie.dart';
import '../../entities/pagination.dart';
import '../../repositories/movie_repository.dart';

// Search Remote Movies
class SearchRemoteMovies {
  final MovieRepository repository;

  SearchRemoteMovies(this.repository);

  Future<Either<Error, Tuple2<PaginationEntity, List<MovieEntity>>>> execute(Map<String, dynamic>? qp) async {
    return await repository.searchRemoteMovies(qp);
  }
}