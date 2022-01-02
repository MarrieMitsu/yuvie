import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'presentation/blocs/movie/movie.dart';

import 'config/routes/application.dart';
import 'config/routes/routes.dart';
import 'presentation/blocs/movie/local_genre_cubit.dart';
import 'presentation/blocs/movie/local_movie_cubit.dart';
import 'presentation/blocs/movie/remote_movie_cubit.dart';
import 'service_locator.dart';
import 'service_locator.dart' as serviceLocator;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  serviceLocator.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LocalGenreCubit>()),
        BlocProvider(create: (_) => sl<RemoteMovieCubit>()),
        BlocProvider(create: (_) => sl<LocalMovieCubit>()),
        BlocProvider(create: (_) => sl<TabsCubit>()),
      ],
      child: MaterialApp(
        title: 'Yuvie',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: Application.router.generator,
      )
    );

    return app;
  }
}
