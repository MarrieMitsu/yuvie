import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'route_handlers.dart';

// Routes
class Routes {
  // initialize
  static String root = '/';
  static String detailMovie = '/detail-movie';
  static String movieForm = '/movie-form';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        print('ROUTE WAS NOT FOUND');
        return;
      }
    );
    router.define(root, handler: rootHandler);
    router.define(detailMovie, handler: detailMovieHandler);
    router.define(movieForm, handler: movieFormHandler);
  }
}