import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yuvie/constants/constants.dart';
import 'package:yuvie/domain/usecases/movie/movie.dart';
import 'package:yuvie/presentation/blocs/movie/remote_movie_cubit.dart';

import 'remote_movie_cubit_test.mocks.dart';

@GenerateMocks([SearchRemoteMovies, GetDetailRemoteMovie])
void main() {
  late MockSearchRemoteMovies searchRemoteMovies;
  late MockGetDetailRemoteMovie getDetailRemoteMovie;

  late RemoteMovieCubit remoteMovieCubit;

  setUp(() {
    searchRemoteMovies = MockSearchRemoteMovies();
    getDetailRemoteMovie = MockGetDetailRemoteMovie();

    remoteMovieCubit = RemoteMovieCubit(
      searchRemoteMovies: searchRemoteMovies, 
      getDetailRemoteMovie: getDetailRemoteMovie
    );
  });

  test('state should be initial', () {
    expect(remoteMovieCubit.state, equals(RemoteMovieInitial(APIOperation.None, false)));
  });

}