import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/services/db/database.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../../domain/usecases/movie/movie.dart';

part 'local_movie_state.dart';

// Local Movie Cubit
class LocalMovieCubit extends Cubit<LocalMovieState> {
  final GetAllLocalMovie _getAllLocalMovie;
  final GetDetailLocalMovie _getDetailLocalMovie;
  final AddLocalMovie _addLocalMovie;
  final EditLocalMovie _editLocalMovie;
  final DeleteLocalMovie _deleteLocalMovie;

  int _page = 0;
  int _totalPages = 1;
  List<MovieEntity> _movies = [];

  LocalMovieCubit({
    required GetAllLocalMovie getAllLocalMovie,
    required GetDetailLocalMovie getDetailLocalMovie,
    required AddLocalMovie addLocalMovie,
    required EditLocalMovie editLocalMovie,
    required DeleteLocalMovie deleteLocalMovie,
  })  : _getAllLocalMovie = getAllLocalMovie,
        _getDetailLocalMovie = getDetailLocalMovie,
        _addLocalMovie = addLocalMovie,
        _editLocalMovie = editLocalMovie,
        _deleteLocalMovie = deleteLocalMovie,
        super(LocalMovieInitial());

  // get all local movie
  void getAllLocalMovie() async {
    if (_page < _totalPages) {
      emit(LocalMovieLoadInProgress());

      final result = await _getAllLocalMovie.execute(_page++);

      result.fold(
        (err) => emit(LocalMovieLoadFailure('Err')),
        (res) => {
          _page = res.head.page,
          _totalPages = res.head.totalPages,
          _movies.addAll(res.tail),
          emit(LocalMovieLoadSuccess(movies: _movies))
        },
      );
    }
  }

  // get detail local movie
  void getDetailLocalMovie(int movieId) async {
    emit(LocalMovieLoadInProgress());

    final result = await _getDetailLocalMovie.execute(movieId);

    result.fold(
      (err) => emit(LocalMovieLoadFailure('Err')),
      (res) => emit(LocalMovieLoadSuccess(movies: _movies, movie: res))
    );
  }

  // add local movie
  void addLocalMovie(MovieWithGenreCompanion entry) async {
    emit(LocalMovieLoadInProgress());

    final result = await _addLocalMovie.execute(entry);

    result.fold(
      (err) => emit(LocalMovieLoadFailure('Err')),
      (res) => {
        _movies.add(res),
        emit(LocalMovieLoadSuccess(movies: _movies)),
      }
    );
  }

  // edit local movie
  void editLocalMovie(MovieWithGenreCompanion entry) async {
    emit(LocalMovieLoadInProgress());

    final result = await _editLocalMovie.execute(entry);

    result.fold(
      (err) => emit(LocalMovieLoadFailure('Err')), 
      (res) => {
        _movies.map((e) => e.id == res.head.id ? res.head : e).toList(),
        emit(LocalMovieLoadSuccess(movies: _movies, movie: res.tail)),
      }
    );
  }

  // delete local movie
  void deleteLocalMovie(int movieId) async {
    emit(LocalMovieLoadInProgress());

    final result = await _deleteLocalMovie.execute(movieId);

    result.fold(
      (err) => emit(LocalMovieLoadFailure('Err')), 
      (res) => {
        _movies.removeWhere((el) => el.id == movieId),
        emit(LocalMovieLoadSuccess(movies: _movies))
      }
    );
  }

}