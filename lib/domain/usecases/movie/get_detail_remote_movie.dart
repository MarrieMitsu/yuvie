import 'package:dartz/dartz.dart';

import '../../entities/movie_detail.dart';
import '../../repositories/movie_repository.dart';

class GetDetailRemoteMovie {
  final MovieRepository repository;

  GetDetailRemoteMovie(this.repository);

  Future<Either<Error, MovieDetailEntity>> execute(int movieId, Map<String, dynamic>? qp) async {
    return await repository.getDetailRemoteMovie(movieId, qp);
  }
}