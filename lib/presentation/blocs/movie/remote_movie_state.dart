part of 'remote_movie_cubit.dart';

// abstract
abstract class RemoteMovieState extends Equatable {
  const RemoteMovieState();

  @override
  List<Object?> get props => [];
}

// Initial
class RemoteMovieInitial extends RemoteMovieState {
  final APIOperation apiOperation;
  final bool freshData;
  
  const RemoteMovieInitial(
    this.apiOperation, 
    this.freshData
  );

  @override
  List<Object?> get props => [apiOperation, freshData];
}

// InProgress
class RemoteMovieLoadInProgress extends RemoteMovieState {
  final APIOperation apiOperation;
  final bool freshData;
  final List<MovieEntity>? movies;

  const RemoteMovieLoadInProgress(
    this.apiOperation, 
    this.freshData, 
    {this.movies}
  );

  @override
  List<Object?> get props => [apiOperation, freshData, movies];
}

// Success
class RemoteMovieLoadSuccess extends RemoteMovieState {
  final APIOperation apiOperation;
  final bool freshData;
  final List<MovieEntity>? movies;
  final MovieDetailEntity? movie;

  const RemoteMovieLoadSuccess(
    this.apiOperation, 
    this.freshData, 
    {this.movies, this.movie}
  );

  @override
  List<Object?> get props => [apiOperation, freshData, movies, movie];
}

// Failure
class RemoteMovieLoadFailure extends RemoteMovieState {
  final APIOperation apiOperation;
  final bool freshData;
  final String error;

  const RemoteMovieLoadFailure(
    this.apiOperation, 
    this.freshData, 
    this.error
  );

  @override
  List<Object?> get props => [apiOperation, freshData, error];
}
