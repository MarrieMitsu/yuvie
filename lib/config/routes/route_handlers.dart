import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:yuvie/constants/constants.dart';

import 'package:yuvie/presentation/screens/dashboard.dart';
import 'package:yuvie/presentation/screens/detail_movie_screen.dart';
import 'package:yuvie/presentation/screens/movie_form_screen.dart';


// rootHandler
var rootHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return Dashboard();
  }
);


// detailMovieHandler
class DetailMovieScreenArguments {
  final int id;
  final MovieSource movieSource;

  DetailMovieScreenArguments({
    required this.id,
    required this.movieSource,
  });
}
var detailMovieHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    final args = context?.settings?.arguments as DetailMovieScreenArguments;

    return DetailMovieScreen(
      id: args.id, 
      movieSource: args.movieSource,
    );
  }
);


// movieFormHandler
class MovieFormScreenArguments {
  final int? id;
  final FormMode formMode;

  MovieFormScreenArguments({
    this.id,
    required this.formMode,
  });
}
var movieFormHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    final args = context?.settings?.arguments as MovieFormScreenArguments;

    return MovieFormScreen(
      id: args.id, 
      formMode: args.formMode
    );
  }
);