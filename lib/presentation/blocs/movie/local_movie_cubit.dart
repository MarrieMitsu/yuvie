import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constants.dart';
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
  Map<int, MovieDetailEntity> _movie = {};

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
        super(LocalMovieInitial(DBOperation.None, false));

  int _nextPage() {
    return _page + 1;
  }

  // get all local movie
  void getAllLocalMovie({bool freshData: false}) async {

    // it will reset all cached data, by triggering
    // refresh the screen
    if (freshData) {
      _page = 0;
      _movies = [];
      _movie = {};
      _totalPages = 1;
    }

    if (_page < _totalPages) {
      if (freshData) {
        emit(LocalMovieLoadInProgress(DBOperation.Read, freshData));
      } else {
        emit(LocalMovieLoadInProgress(DBOperation.Read, freshData, movies: _movies));
      }

      final result = await _getAllLocalMovie.execute(_nextPage());

      result.fold(
        (err) => emit(LocalMovieLoadFailure(DBOperation.Read, freshData, 'Err')),
        (res) => {
          _page = res.head.page,
          _totalPages = res.head.totalPages,
          _movies.addAll(res.tail),
          emit(LocalMovieLoadSuccess(DBOperation.Read, freshData, movies: _movies))
        },
      );
    }
  }

  // get detail local movie
  void getDetailLocalMovie(int movieId, {bool freshData = false}) async {

    if (_movie.containsKey(movieId)) {
      // using latest cached data if movie id equals
      emit(LocalMovieLoadSuccess(DBOperation.Read, freshData, movies: _movies, movie: _movie[movieId]));
    } else {
      emit(LocalMovieLoadInProgress(DBOperation.Read, freshData, movies: _movies));

      final result = await _getDetailLocalMovie.execute(movieId);

      result.fold(
        (err) => emit(LocalMovieLoadFailure(DBOperation.Read, freshData, 'Err')),
        (res) => {
          _movie[res.id] = res,
          emit(LocalMovieLoadSuccess(DBOperation.Read, freshData, movies: _movies, movie: _movie[res.id]))
        }
      );

    }

  }

  // add local movie
  void addLocalMovie(MovieWithGenreCompanion entry, {bool freshData = false}) async {
    emit(LocalMovieLoadInProgress(DBOperation.Create, freshData));

    final result = await _addLocalMovie.execute(entry);

    result.fold(
      (err) => emit(LocalMovieLoadFailure(DBOperation.Create, freshData, 'Err')),
      (res) => {
        _movies.add(res),
        emit(LocalMovieLoadSuccess(DBOperation.Create, freshData, movies: _movies)),
      }
    );
  }

  // edit local movie
  void editLocalMovie(MovieWithGenreCompanion entry,
      {bool freshData = false}) async {
    emit(LocalMovieLoadInProgress(DBOperation.Update, freshData));

    final result = await _editLocalMovie.execute(entry);

    result.fold(
      (err) => emit(LocalMovieLoadFailure(DBOperation.Update, freshData, 'Err')), 
      (res) => {
        _movies.map((e) => e.id == res.head.id ? res.head : e).toList(),
        _movie[res.tail.id] = res.tail,
        emit(LocalMovieLoadSuccess(DBOperation.Update, freshData, movies: _movies, movie: _movie[res.tail.id])),
      }
    );
  }

  // delete local movie
  void deleteLocalMovie(int movieId, {bool freshData = false}) async {
    emit(LocalMovieLoadInProgress(DBOperation.Delete, freshData, movies: _movies));

    final result = await _deleteLocalMovie.execute(movieId);

    result.fold(
      (err) => emit(LocalMovieLoadFailure(DBOperation.Delete, freshData, 'Err')), 
      (res) => {
        _movies.removeWhere((el) => el.id == movieId),
        emit(LocalMovieLoadSuccess(DBOperation.Delete, freshData, movies: _movies))
      }
    );
  }

}