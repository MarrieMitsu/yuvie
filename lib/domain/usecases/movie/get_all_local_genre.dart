import 'package:dartz/dartz.dart';

import '../../entities/genre.dart';
import '../../repositories/movie_repository.dart';


class GetAllLocalGenre {
  final MovieRepository repository;

  GetAllLocalGenre(this.repository);

  Future<Either<Error, List<GenreEntity>>> execute() async {
    return await repository.getAllLocalGenre();
  }

}