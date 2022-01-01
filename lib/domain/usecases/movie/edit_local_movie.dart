import 'package:dartz/dartz.dart';

import '../../../data/services/db/database.dart';
import '../../entities/movie.dart';
import '../../entities/movie_detail.dart';
import '../../repositories/movie_repository.dart';

class EditLocalMovie {
  final MovieRepository repository;

  EditLocalMovie(this.repository);

  Future<Either<Error, Tuple2<MovieEntity, MovieDetailEntity>>> execute(MovieWithGenreCompanion entry) async {
    return await repository.editLocalMovie(entry);
  }
}