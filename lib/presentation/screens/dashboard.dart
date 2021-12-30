import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:yuvie/constants/constants.dart';

import 'package:yuvie/config/routes/application.dart';
import 'package:yuvie/config/routes/route_handlers.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Text(dotenv.env['APP_ENV']!),
              Text(dotenv.env['DEV_API_URL']!),
              Text(dotenv.env['PROD_API_URL']!),
              Text(dotenv.env['API_KEY']!),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Application.router.navigateTo(
                      context,
                      '/detail-movie',
                      routeSettings: RouteSettings(
                        arguments: DetailMovieScreenArguments(
                          id: 1, 
                          movieSource: MovieSource.LOCAL
                        )
                      ),
                    );
                  },
                  child: Text('Detail Movie: local'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Application.router.navigateTo(
                      context,
                      '/detail-movie',
                      routeSettings: RouteSettings(
                        arguments: DetailMovieScreenArguments(
                          id: 2,
                          movieSource: MovieSource.REMOTE
                        )
                      ),
                    );
                  },
                  child: Text('Detail Movie: remote'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Application.router.navigateTo(
                      context,
                      '/movie-form',
                      routeSettings: RouteSettings(
                        arguments: MovieFormScreenArguments(
                          formMode: FormMode.CREATE
                        ),
                      ),
                    );
                  },
                  child: Text('Movie Form: create'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Application.router.navigateTo(
                      context,
                      '/movie-form',
                      routeSettings: RouteSettings(
                        arguments:
                            MovieFormScreenArguments(
                              id: 3,
                              formMode: FormMode.EDIT
                            ),
                      ),
                    );
                  },
                  child: Text('Movie Form: edit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}