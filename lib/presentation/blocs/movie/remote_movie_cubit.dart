import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../constants/constants.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../../domain/usecases/movie/movie.dart';

part 'remote_movie_state.dart';

// Remote Movie Cubit
class RemoteMovieCubit extends Cubit<RemoteMovieState> {
  final SearchRemoteMovies _searchRemoteMovies;
  final GetDetailRemoteMovie _getDetailRemoteMovie;

  String _keyword = '';
  int _page = 0;
  int _totalPages = 1;
  List<MovieEntity> _movies = [];
  Map<int, MovieDetailEntity> _movie = {};

  RemoteMovieCubit({
    required SearchRemoteMovies searchRemoteMovies,
    required GetDetailRemoteMovie getDetailRemoteMovie,
  })  : _searchRemoteMovies = searchRemoteMovies, 
        _getDetailRemoteMovie = getDetailRemoteMovie,
        super(RemoteMovieInitial(APIOperation.None, false));

  int _nextPage() {
    return _page + 1;
  }

  // search remote movies
  void searchRemoteMovies({String keyword = '', bool freshData = false, bool useCachedKeyword = false}) async {
    
    if (!useCachedKeyword) {
      _keyword = keyword;
    }

    // it will reset all cached data, by triggering
    // new search query or refresh the screen
    if (freshData) {
      _page = 0;
      _movies = [];
      _movie = {};
      _totalPages = 1;
    }
    
    if (_keyword.isEmpty) {
      emit(RemoteMovieInitial(APIOperation.GET, freshData));
    } else {
      if (_page < _totalPages) {
        if (freshData) {
          emit(RemoteMovieLoadInProgress(APIOperation.GET, freshData));
        } else {
          emit(RemoteMovieLoadInProgress(APIOperation.GET, freshData, movies: _movies));
        }

        final result = await _searchRemoteMovies.execute({
          'api_key': dotenv.env['API_KEY'],
          'query': _keyword,
          'page': _nextPage(),
        });

        result.fold(
          (err) => emit(RemoteMovieLoadFailure(APIOperation.GET, freshData, 'Err')),
          (res) => {
            _page = res.head.page,
            _totalPages = res.head.totalPages,
            _movies.addAll(res.tail),
            emit(RemoteMovieLoadSuccess(APIOperation.GET, freshData, movies: _movies))
          },
        );
      }
    }
  }

  // get detail remote movie
  void getDetailRemoteMovie(int movieId, {bool freshData = false}) async {

    if (_movie.containsKey(movieId)) {
      // using latest cached data if movie id equals
      emit(RemoteMovieLoadSuccess(APIOperation.GET, freshData, movies: _movies, movie: _movie[movieId]));
    } else {
      emit(RemoteMovieLoadInProgress(APIOperation.GET, freshData, movies: _movies));

      final result = await _getDetailRemoteMovie.execute(movieId, {
        'api_key': dotenv.env['API_KEY'],
      });

      result.fold(
        (err) => emit(RemoteMovieLoadFailure(APIOperation.GET, freshData, 'Err')),
        (res) => {
          _movie[res.id] = res, // cache result to the movie map
          emit(RemoteMovieLoadSuccess(APIOperation.GET, freshData, movies: _movies, movie: _movie[res.id]))
        }
      );
    }
  }

}