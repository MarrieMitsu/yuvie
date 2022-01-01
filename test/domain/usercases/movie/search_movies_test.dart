import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:yuvie/domain/entities/movie.dart';
import 'package:yuvie/domain/entities/pagination.dart';
import 'package:yuvie/domain/repositories/movie_repository.dart';
import 'package:yuvie/domain/usecases/movie/search_remote_movies.dart';

import 'search_movies_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository movieRepository;
  late SearchRemoteMovies searchRemoteMovies;

  final head = PaginationEntity(
    page: 1, 
    totalResults: 1, 
    totalPages: 1
  );

  final List<MovieEntity> tail = [];

  setUp(() {
    movieRepository = MockMovieRepository();
    searchRemoteMovies = SearchRemoteMovies(movieRepository);
  });

  test('should return SearchMovieApiModel', () async {
    when(movieRepository.searchRemoteMovies({}))
        .thenAnswer((_) async => Right(Tuple2(head, tail)));

    final result = await searchRemoteMovies.execute({});

    expect(result, Right(Tuple2(head, tail)));
    verify(movieRepository.searchRemoteMovies({}));
  }); 

}