import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/movie_repository_impl.dart';
import 'data/services/api/api.dart';
import 'data/services/db/database.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/movie/movie.dart';
import 'presentation/blocs/movie/movie.dart';
import 'utils/dio_client.dart';

final sl = GetIt.instance;

// Initialize service locator
void init() {
  // movie bloc
  sl.registerFactory(() => RemoteMovieCubit(
    searchRemoteMovies: sl(), 
    getDetailRemoteMovie: sl(),
  ));

  sl.registerFactory(() => LocalMovieCubit(
    getAllLocalMovie: sl(), 
    getDetailLocalMovie: sl(), 
    addLocalMovie: sl(), 
    editLocalMovie: sl(), 
    deleteLocalMovie: sl(),
  ));

  // movie usecase
  sl.registerLazySingleton(() => SearchRemoteMovies(sl()));
  sl.registerLazySingleton(() => GetDetailRemoteMovie(sl()));
  sl.registerLazySingleton(() => GetAllLocalMovie(sl()));
  sl.registerLazySingleton(() => GetDetailLocalMovie(sl()));
  sl.registerLazySingleton(() => AddLocalMovie(sl()));
  sl.registerLazySingleton(() => EditLocalMovie(sl()));
  sl.registerLazySingleton(() => DeleteLocalMovie(sl()));

  // movie repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
    searchApi: sl(), 
    moviesApi: sl(), 
    db: sl(),
  ));

  // data
  sl.registerLazySingleton<SearchApi>(() => SearchApiImpl(sl()));
  sl.registerLazySingleton<MoviesApi>(() => MoviesApiImpl(sl()));
  sl.registerLazySingleton(() => Database(openConnection()));

  // utils
  sl.registerLazySingleton(() => DioClient());

}