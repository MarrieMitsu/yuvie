part of 'local_genre_cubit.dart';

// abstract
abstract class LocalGenreState extends Equatable {
  const LocalGenreState();

  @override
  List<Object?> get props => [];
}

// Initial
class LocalGenreInitial extends LocalGenreState {
  final DBOperation dbOperation;
  final bool freshData;

  const LocalGenreInitial(
    this.dbOperation, 
    this.freshData
  );

  @override
  List<Object?> get props => [dbOperation, freshData];
}

// InProgress
class LocalGenreLoadInProgress extends LocalGenreState {
  final DBOperation dbOperation;
  final bool freshData;

  const LocalGenreLoadInProgress(
    this.dbOperation, 
    this.freshData
  );

  @override
  List<Object?> get props => [dbOperation, freshData];
}

// Success
class LocalGenreLoadSuccess extends LocalGenreState {
  final DBOperation dbOperation;
  final bool freshData;
  final List<GenreEntity>? genres;

  const LocalGenreLoadSuccess(
    this.dbOperation, 
    this.freshData, 
    {this.genres}
  );

  @override
  List<Object?> get props => [dbOperation, freshData, genres];
}

// Failure
class LocalGenreLoadFailure extends LocalGenreState {
  final DBOperation dbOperation;
  final bool freshData;
  final String error;

  const LocalGenreLoadFailure(
    this.dbOperation, 
    this.freshData, 
    this.error
  );

  @override
  List<Object?> get props => [dbOperation, freshData, error];
}
