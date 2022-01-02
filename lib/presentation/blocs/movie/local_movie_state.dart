part of 'local_movie_cubit.dart';

// abstract
abstract class LocalMovieState extends Equatable {
  const LocalMovieState();

  @override
  List<Object?> get props => [];
}

// Initial
class LocalMovieInitial extends LocalMovieState {
  final DBOperation dbOperation;
  final bool freshData;

  const LocalMovieInitial(
    this.dbOperation,
    this.freshData
  );

  @override
  List<Object?> get props => [dbOperation, freshData];
}

// InProgress
class LocalMovieLoadInProgress extends LocalMovieState {
  final DBOperation dbOperation;
  final bool freshData;
  final List<MovieEntity>? movies;

  const LocalMovieLoadInProgress(
    this.dbOperation, 
    this.freshData, 
    {this.movies}
  );

  @override
  List<Object?> get props => [movies, freshData, dbOperation];
}

// Success
class LocalMovieLoadSuccess extends LocalMovieState {
  final DBOperation dbOperation;
  final bool freshData;
  final List<MovieEntity>? movies;
  final MovieDetailEntity? movie;

  const LocalMovieLoadSuccess(
    this.dbOperation, 
    this.freshData, 
    {this.movies, this.movie}
  );

  @override
  List<Object?> get props => [dbOperation, freshData, movies, movie];
}

// Failure
class LocalMovieLoadFailure extends LocalMovieState {
  final DBOperation dbOperation;
  final bool freshData;
  final String error;

  const LocalMovieLoadFailure(
    this.dbOperation, 
    this.freshData, 
    this.error
  );

  @override
  List<Object?> get props => [dbOperation, freshData, error];
}