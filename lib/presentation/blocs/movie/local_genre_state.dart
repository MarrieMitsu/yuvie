part of 'local_genre_cubit.dart';

// abstract
abstract class LocalGenreState extends Equatable {
  const LocalGenreState();

  @override
  List<Object?> get props => [];
}

// Initial
class LocalGenreInitial extends LocalGenreState {}

// InProgress
class LocalGenreLoadInProgress extends LocalGenreState {}

// Success
class LocalGenreLoadSuccess extends LocalGenreState {
  final List<GenreEntity>? genres;

  const LocalGenreLoadSuccess({this.genres});

  @override
  List<Object?> get props => [genres];
}

// Failure
class LocalGenreLoadFailure extends LocalGenreState {
  final String error;

  const LocalGenreLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
