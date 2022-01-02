import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/application.dart';
import '../../config/routes/route_handlers.dart';
import '../../constants/constants.dart';
import '../../domain/entities/movie_detail.dart';
import '../blocs/movie/movie.dart';
import '../widgets/badges.dart';
import '../widgets/custom_buttons.dart';


// detail movie screen
class DetailMovieScreen extends StatefulWidget {
  final int id;
  final MovieSource movieSource;

  const DetailMovieScreen({
    Key? key,
    required this.id,
    required this.movieSource,
  }) : super(key: key);

  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {

  @override
  void initState() {
    switch (widget.movieSource) {
      case MovieSource.LOCAL:
        BlocProvider.of<LocalMovieCubit>(context)
          .getDetailLocalMovie(widget.id);
        break;
      case MovieSource.REMOTE:
        BlocProvider.of<RemoteMovieCubit>(context)
          .getDetailRemoteMovie(widget.id);
        break;
      default:
    }

    super.initState();
  }

  Widget _listBuilder(MovieDetailEntity movie) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 25.0,
      ),
      children: <Widget>[
        Container(
          height: 250,
          alignment: Alignment.center,
          child: Container(
            height: double.infinity,
            width: 200.0,
            color: Colors.blue,
            child: CachedNetworkImage(
              imageUrl: PosterUrl.w185(movie.posterPath),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          movie.title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 20.0),
        Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: <Widget>[
            for (var genre in movie.genres)
              Badges(
                text: genre.name
              ),
          ],
        ),
        SizedBox(height: 20.0),
        Text(
          'Original title : ${movie.originalTitle}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Original language : ${movie.originalLanguage}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Overview : ${movie.overview}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Popularity : ${movie.popularity}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Release data : ${movie.releaseDate}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Revenue : ${movie.revenue}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Runtime : ${movie.runtime}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Status : ${movie.status}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Tagline : ${movie.tagline}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Vote average : ${movie.voteAverage}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Vote count: ${movie.voteCount}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: CustomIconButton(
            onTap: () {
              Application.router
                .pop(context);
            }, 
            icon: Icons.arrow_back,
          ),
          actions: widget.movieSource == MovieSource.LOCAL ? [
            CustomIconButton(
              onTap: () {
                Application.router
                  .navigateTo(
                    context, 
                    '/movie-form',
                    routeSettings: RouteSettings(
                      arguments: MovieFormScreenArguments(
                        id: widget.id,
                        formMode: FormMode.EDIT
                      )
                    )
                  );
              },
              icon: Icons.edit,
            ),
            CustomIconButton(
              onTap: () {
                BlocProvider.of<LocalMovieCubit>(context)
                  .deleteLocalMovie(widget.id);
                  Application.router
                    .navigateTo(context, '/', replace: true);
              },
              icon: Icons.delete
            ),
          ] : null,
        ),
        body: widget.movieSource == MovieSource.REMOTE ? BlocBuilder<RemoteMovieCubit, RemoteMovieState>(
          builder: (context, state) {

            if (state is RemoteMovieInitial) {
              return Center(
                child: Text('Initial'),
              );
            } else if (state is RemoteMovieLoadInProgress) {
              return Center(
                child: Text('Loading'),
              );
            } else if (state is RemoteMovieLoadSuccess) {
              final movie = state.movie!;

              return _listBuilder(movie);
              
            } else if (state is RemoteMovieLoadFailure) {
              return Center(
                child: Text(state.error),
              );
            }

            return Container();

          }
        ) : BlocBuilder<LocalMovieCubit, LocalMovieState>(
          builder: (context, state) {

            if (state is LocalMovieInitial) {
              return Center(
                child: Text('Initial'),
              );
            } else if (state is LocalMovieLoadInProgress) {
              return Center(
                child: Text('Loading'),
              );
            } else if (state is LocalMovieLoadSuccess) {
              final movie = state.movie!;

              return _listBuilder(movie);
              
            } else if (state is LocalMovieLoadFailure) {
              return Center(
                child: Text(state.error),
              );
            }

            return Container();

          }
        ),
      ),
    );
  }
}