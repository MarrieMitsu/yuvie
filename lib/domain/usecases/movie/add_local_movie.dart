import 'package:dartz/dartz.dart';

import '../../../data/services/db/database.dart';
import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';

class AddLocalMovie {
  final MovieRepository repository;

  AddLocalMovie(this.repository);

  Future<Either<Error, MovieEntity>> execute(MovieWithGenreCompanion entry) async {
    return await repository.addLocalMovie(entry);
  }
}