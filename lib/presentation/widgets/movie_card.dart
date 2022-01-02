import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../config/routes/application.dart';
import '../../config/routes/route_handlers.dart';
import '../../constants/constants.dart';

class MovieCard extends StatelessWidget {
  final Function()? onTap;
  final int id;
  final String poster;
  final String title;
  final String releaseDate;
  final String overview;
  final MovieSource movieSource;
  
  const MovieCard({
    Key? key,
    this.onTap,
    required this.id,
    required this.poster,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.movieSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router
          .navigateTo(
            context, 
            '/detail-movie',
            routeSettings: RouteSettings(
              arguments: DetailMovieScreenArguments(
                id: id,
                movieSource: movieSource,
              )
            )
          );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: CachedNetworkImage(
                imageUrl: poster,
                placeholder: (context, url) => CircularProgressIndicator(),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      releaseDate,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}