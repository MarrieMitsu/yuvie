part of 'local_movie_cubit.dart';

// abstract
abstract class LocalMovieState extends Equatable {
  const LocalMovieState();

  @override
  List<Object?> get props => [];
}

// Initial
class LocalMovieInitial extends LocalMovieState {}

// InProgress
class LocalMovieLoadInProgress extends LocalMovieState {}

// Success
class LocalMovieLoadSuccess extends LocalMovieState {
  final List<MovieEntity>? movies;
  final MovieDetailEntity? movie;

  const LocalMovieLoadSuccess({this.movies, this.movie});

  @override
  List<Object?> get props => [movies];
}

// Failure
class LocalMovieLoadFailure extends LocalMovieState {
  final String error;

  const LocalMovieLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}