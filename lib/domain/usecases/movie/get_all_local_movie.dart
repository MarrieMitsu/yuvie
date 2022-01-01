import 'package:dartz/dartz.dart';

import '../../entities/movie.dart';
import '../../entities/pagination.dart';
import '../../repositories/movie_repository.dart';

class GetAllLocalMovie {
  final MovieRepository repository;

  GetAllLocalMovie(this.repository);

  Future<Either<Error, Tuple2<PaginationEntity, List<MovieEntity>>>> execute(int page) async {
    return await repository.getAllLocalMovie(page);
  }

}