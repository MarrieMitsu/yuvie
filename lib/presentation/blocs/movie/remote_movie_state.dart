part of 'remote_movie_cubit.dart';

// abstract
abstract class RemoteMovieState extends Equatable {
  const RemoteMovieState();

  @override
  List<Object?> get props => [];
}

// Initial
class RemoteMovieInitial extends RemoteMovieState {}

// InProgress
class RemoteMovieLoadInProgress extends RemoteMovieState {}

// Success
class RemoteMovieLoadSuccess extends RemoteMovieState {
  final List<MovieEntity>? movies;
  final MovieDetailEntity? movie;

  const RemoteMovieLoadSuccess({this.movies, this.movie});

  @override
  List<Object?> get props => [movies, movie];
}

// Failure
class RemoteMovieLoadFailure extends RemoteMovieState {
  final String error;

  const RemoteMovieLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
