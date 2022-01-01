import 'package:dartz/dartz.dart';

import '../../entities/movie_detail.dart';
import '../../repositories/movie_repository.dart';

class GetDetailLocalMovie {
  final MovieRepository repository;

  GetDetailLocalMovie(this.repository);

  Future<Either<Error, MovieDetailEntity>> execute(int movieId) async {
    return await repository.getDetailLocalMovie(movieId);
  }

}