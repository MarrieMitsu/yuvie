import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/application.dart';
import '../../config/routes/route_handlers.dart';
import '../../constants/constants.dart';
import '../blocs/movie/movie.dart';
import '../widgets/custom_appbar.dart';
import 'movie_screen.dart';
import 'search_movie_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _state = 0;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollListener(context);
    super.initState();
  }

  void _scrollListener(context) {
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter <= 0) {
        BlocProvider.of<RemoteMovieCubit>(context)
            .searchRemoteMovies(useCachedKeyword: true);
      }
    });
  }

  // refresh the screen or current section
  // of the app
  Future<void> _onRefresh() async {
    if (_state == 0) {
      BlocProvider.of<LocalMovieCubit>(context)
          .getAllLocalMovie(
            freshData: true, 
          );
    } else if (_state == 1) {
      BlocProvider.of<RemoteMovieCubit>(context)
        .searchRemoteMovies(
          freshData: true, 
          useCachedKeyword: true
        );
    }
  }

  // tab builder
  Widget tabBuilder(BuildContext context) {
    return BlocBuilder<TabsCubit, int>(
      builder: (context, state) {
        _state = state;

        if (state == 0) {
          return MovieScreen();
        } else if (state == 1) {
          return SearchMovieScreen();
        }

        return SearchMovieScreen();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()
              ),
              child: Column(
                children: <Widget>[
                  CustomAppbar(),
                  SizedBox(height: 10.0),
                  tabBuilder(context),
                ],
              )
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<TabsCubit, int>(
          builder: (context, state) {
            if (state == 0) {
              return FloatingActionButton.extended(
                onPressed: () {
                  Application.router
                    .navigateTo(
                      context, 
                      '/movie-form',
                      routeSettings: RouteSettings(
                        arguments: MovieFormScreenArguments(
                          formMode: FormMode.CREATE
                        )
                      )
                    );
                },
                label: Text('Movie'),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.black54,
              );
            }

            return SizedBox.shrink();
          }
        ),
      ),
    );
  }

}
