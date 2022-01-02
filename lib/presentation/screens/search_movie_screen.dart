import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../blocs/movie/movie.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/movie_card.dart';

// search movie screen
class SearchMovieScreen extends StatefulWidget {
  const SearchMovieScreen({ Key? key }) : super(key: key);

  @override
  _SearchMovieScreenState createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends State<SearchMovieScreen> {
  final _searchController = TextEditingController();
  String _keyword = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: CustomTextField(
            controller: _searchController,
            hintText: 'Search movies...',
            onChanged: (val) {
              _keyword = val;
            },
            onSubmitted: (_) {
              _searchController.clear();
              context
                .read<RemoteMovieCubit>()
                .searchRemoteMovies(keyword: _keyword, freshData: true);
            },
            lastWidget: Material(
              child: InkWell(
                onTap: () {
                  context
                    .read<RemoteMovieCubit>()
                    .searchRemoteMovies(
                      keyword: _searchController.text, 
                      freshData: true
                    );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Icon(
                    Icons.search,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5.0),
        BlocBuilder<RemoteMovieCubit, RemoteMovieState>(
            builder: (context, state) {
          if (state is RemoteMovieInitial) {
            return Center(
              child: Text('Try to search something :)'),
            );
          } else if (state is RemoteMovieLoadInProgress) {
            if (state.freshData) {
              return Center(
                child: Text('Hold up, almost there! hope theres no failure'),
              );
            } else {
              // return Container();
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
                      movieSource: MovieSource.REMOTE,
                    );
                  });
            }
          } else if (state is RemoteMovieLoadSuccess) {
            // return Container();
            final movies = state.movies!;

            if (movies.isEmpty) {
              return Center(
                child: Text(
                  'Are you sure with the keyword? Because I can\'t find it'
                ),
              );
            }
    
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
                  movieSource: MovieSource.REMOTE,
                );
              }
            );
          } else if (state is RemoteMovieLoadFailure) {
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