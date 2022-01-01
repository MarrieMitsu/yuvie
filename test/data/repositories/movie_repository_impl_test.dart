import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yuvie/data/models/api/search_movie_api_model.dart';
import 'package:yuvie/data/repositories/movie_repository_impl.dart';
import 'package:yuvie/data/services/api/api.dart';
import 'package:yuvie/data/services/api/search_api.dart';
import 'package:yuvie/data/services/db/database.dart';
import 'package:yuvie/domain/entities/movie.dart';
import 'package:yuvie/domain/entities/pagination.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateMocks([SearchApi, MoviesApi, Database])
void main() {
  late MovieRepositoryImpl repository;
  late MockSearchApi searchApi;
  late MockMoviesApi moviesApi;
  late MockDatabase db;

  setUp(() {
    searchApi = MockSearchApi();
    moviesApi = MockMoviesApi();
    db = MockDatabase();
    repository = MovieRepositoryImpl(
      searchApi: searchApi, 
      moviesApi: moviesApi, 
      db: db
    );

  });

  test('search remote movies', () async {
    final movieModel = <MovieModel>[];
    final list = <MovieEntity>[];
    final matcher = Tuple2(PaginationEntity(page: 1, totalPages: 1,totalResults: 1), list);

    when(
      searchApi.searchMovies(any))
      .thenAnswer((_) async => 
        SearchMovieApiModel(
          page: 1, 
          results: movieModel, 
          totalResults: 1, 
          totalPages: 1
        )
    );

    final result = await repository.searchRemoteMovies({});

    result.fold(
      (err) => fail('search remote movies failed'), 
      (res) => {
        verify(searchApi.searchMovies(any)).called(1),
        expect(res.head, equals(matcher.head)),
        expect(res.tail, equals(matcher.tail)),
      }
    );

    
  });

}