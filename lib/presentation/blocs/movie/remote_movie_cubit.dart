import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../../domain/usecases/movie/movie.dart';

part 'remote_movie_state.dart';

// Remote Movie Cubit
class RemoteMovieCubit extends Cubit<RemoteMovieState> {
  final SearchRemoteMovies _searchRemoteMovies;
  final GetDetailRemoteMovie _getDetailRemoteMovie;

  int _page = 0;
  int _totalPages = 1;
  List<MovieEntity> _movies = [];

  RemoteMovieCubit({
    required SearchRemoteMovies searchRemoteMovies,
    required GetDetailRemoteMovie getDetailRemoteMovie,
  })  : _searchRemoteMovies = searchRemoteMovies, 
        _getDetailRemoteMovie = getDetailRemoteMovie,
        super(RemoteMovieInitial());

  // search remote movies
  Future<void> searchRemoteMovies(String keyword) async {
    if (_page < _totalPages) {
      emit(RemoteMovieLoadInProgress());

      final result = await _searchRemoteMovies.execute({
        'query': keyword,
        'page': _page++,
      });

      result.fold(
        (err) => emit(RemoteMovieLoadFailure('Err')),
        (res) => {
          _page = res.head.page,
          _totalPages = res.head.totalPages,
          _movies.addAll(res.tail),
          emit(RemoteMovieLoadSuccess(movies: _movies))
        },
      );
    }
  }

  // get detail remote movie
  Future<void> getDetailRemoteMovie(int movieId) async {
    emit(RemoteMovieLoadInProgress());

    final result = await _getDetailRemoteMovie.execute(movieId, {});

    result.fold(
      (err) => emit(RemoteMovieLoadFailure('Err')),
      (res) => emit(RemoteMovieLoadSuccess(movies: _movies, movie: res))
    );
  }

}