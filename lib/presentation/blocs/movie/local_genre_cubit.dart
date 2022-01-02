import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constants.dart';
import '../../../domain/entities/genre.dart';
import '../../../domain/usecases/movie/get_all_local_genre.dart';

part 'local_genre_state.dart';

// Local Genre Cubit
class LocalGenreCubit extends Cubit<LocalGenreState> {
  final GetAllLocalGenre _getAllLocalGenre;

  LocalGenreCubit({
    required GetAllLocalGenre getAllLocalGenre,
  })  : _getAllLocalGenre = getAllLocalGenre,
        super(LocalGenreInitial(DBOperation.None, false));

  // get all local genre
  void getAllLocalGenre({bool freshData = false}) async {
    emit(LocalGenreLoadInProgress(DBOperation.Read, freshData));

    final result = await _getAllLocalGenre.execute();

    result.fold(
      (err) => emit(LocalGenreLoadFailure(DBOperation.Read, freshData, 'error')), 
      (res) => emit(LocalGenreLoadSuccess(DBOperation.Read, freshData, genres: res)),
    );
  }

}
