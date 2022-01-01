import 'package:dartz/dartz.dart';

import '../../repositories/movie_repository.dart';

class DeleteLocalMovie {
  final MovieRepository repository;

  DeleteLocalMovie(this.repository);

  Future<Either<Error, bool>> execute(int movieId) async {
    return await repository.deleteLocalMovie(movieId);
  }
}