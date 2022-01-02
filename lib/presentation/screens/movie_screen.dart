import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../blocs/movie/movie.dart';
import '../widgets/movie_card.dart';

// movie screen
class MovieScreen extends StatefulWidget {
  const MovieScreen({ Key? key }) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {

  @override
  void initState() {
    BlocProvider.of<LocalMovieCubit>(context)
        .getAllLocalMovie(freshData: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlocBuilder<LocalMovieCubit, LocalMovieState>(
            builder: (context, state) {
          if (state is LocalMovieInitial) {
            return Center(
              child: Text('Empty like my ...'),
            );
          } else if (state is LocalMovieLoadInProgress) {
            if (state.freshData) {
              return Center(
                child: Text('ZZzzz'),
              );
            } else {
              final movies = state.movies!;

              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: movies.length,
                  itemBuilder: (context, idx) {
                    return MovieCard(
                      id: movies[idx].id,
                      poster: PosterUrl.w92(movies[idx].posterPath),
                      title: movies[idx].title,
                      releaseDate: movies[idx].releaseDate,
                      overview: movies[idx].overview,
                      movieSource: MovieSource.LOCAL,
                    );
                  });
            }
          } else if (state is LocalMovieLoadSuccess) {
            // return Container();
            final movies = state.movies!;

            if (movies.isEmpty) {
              return Center(
                child: Text('Your database empty o_o!'),
              );
            }

            return ListView.builder(
                reverse: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (context, idx) {
                  return MovieCard(
                    id: movies[idx].id,
                    poster: PosterUrl.w92(movies[idx].posterPath),
                    title: movies[idx].title,
                    releaseDate: movies[idx].releaseDate,
                    overview: movies[idx].overview,
                    movieSource: MovieSource.LOCAL,
                  );
                });
          } else if (state is LocalMovieLoadFailure) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Container();
          }
        })
      ],
    );
  }
}