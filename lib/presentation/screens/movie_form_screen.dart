import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/routes/application.dart';
import '../../constants/constants.dart';
import '../../data/services/db/database.dart';
import '../../domain/entities/movie_detail.dart';
import '../blocs/movie/movie.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/custom_text_field.dart';


// movie form screen
class MovieFormScreen extends StatefulWidget {
  final int? id;
  final FormMode formMode;

  const MovieFormScreen({ 
    Key? key,
    this.id,
    required this.formMode,
  }) : super(key: key);

  @override
  _MovieFormScreenState createState() => _MovieFormScreenState();
}

class _MovieFormScreenState extends State<MovieFormScreen> {
  Map<int, GenresCompanion> _genres = {};

  final _titleController = TextEditingController();
  String _title = '';

  bool _adult = false;

  final _budgetController = TextEditingController();
  int _budget = 0;

  final _originalLanguageController = TextEditingController();
  String _originalLanguage = '';

  final _originalTitleController = TextEditingController();
  String _originalTitle = '';

  final _overviewController = TextEditingController();
  String _overview = '';

  final _popularityController = TextEditingController();
  double _popularity = 0.0;

  String _posterPath = '';

  final _revenueController = TextEditingController();
  int _revenue = 0;

  final _runtimeController = TextEditingController();
  int _runtime = 0;

  final _statusController = TextEditingController();
  String _status = '';

  final _taglineController = TextEditingController();
  String _tagline = '';

  final _voteAverageController = TextEditingController();
  double _voteAverage = 0.0;

  final _voteCountController = TextEditingController();
  int _voteCount = 0;

  // check box dialog
  void _checkBoxDialog() {
    showDialog(
      context: context, 
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return BlocBuilder<LocalGenreCubit, LocalGenreState>(
              builder: (context, state) {
                if (state is LocalGenreLoadSuccess) {

                  return AlertDialog(
                    actions: List.generate(
                      state.genres!.length, 
                      (idx) {
                        final genreEntity = state.genres![idx];

                        return CheckboxListTile(
                          value: _genres.containsKey(genreEntity.id), 
                          title: Text(
                            genreEntity.name
                          ),
                          onChanged: (val) {
                            setState(() {
                              if (val!) {
                                _genres[genreEntity.id] = GenresCompanion(
                                  id: Value(genreEntity.id),
                                  name: Value(genreEntity.name),
                                );
                              } else {
                                _genres.removeWhere((key, value) => 
                                  key == genreEntity.id
                                );
                              }
                            });
                          }
                        );
                      }),
                  );
                  
                }
                return SizedBox.shrink();
              }
            );
          }
        );
      }
    );
  }

  void _fillInput(MovieDetailEntity entry) {
    for (var genre in entry.genres) {
      _genres[genre.id] = GenresCompanion(
        id: Value(genre.id), 
        name: Value(genre.name),
      );
    }

    _titleController.text = entry.title;
    _title = entry.title;

    _adult = entry.adult;

    _budgetController.text = entry.budget.toString();
    _budget = entry.budget;

    _originalLanguageController.text = entry.originalLanguage;
    _originalLanguage = entry.originalLanguage;

    _originalTitleController.text = entry.originalTitle;
    _originalTitle = entry.originalTitle;

    _overviewController.text = entry.overview;
    _overview = entry.overview;

    _popularityController.text = entry.popularity.toString();
    _popularity = entry.popularity;

    _posterPath = entry.posterPath;

    _revenueController.text = entry.revenue.toString();
    _revenue = entry.revenue;

    _runtimeController.text = entry.runtime.toString();
    _runtime = entry.runtime;

    _statusController.text = entry.status;
    _status = entry.status;

    _taglineController.text = entry.tagline;
    _tagline = entry.tagline;

    _voteAverageController.text = entry.voteAverage.toString();
    _voteAverage = entry.voteAverage;

    _voteCountController.text = entry.voteCount.toString();
    _voteCount = entry.voteCount;
  }

  // save data
  void _saveData() {
    switch (widget.formMode) {
      case FormMode.CREATE:
        final movie = MoviesCompanion.insert(
          adult: Value(_adult),
          backdropPath: Value('dummy'),
          budget: Value(_budget),
          originalLanguage: Value(_originalLanguage),
          originalTitle: Value(_originalTitle),
          overview: Value(_overview),
          popularity: Value(_popularity),
          posterPath: Value('dummy'),
          revenue: Value(_revenue),
          runtime: Value(_runtime),
          status: Value(_status),
          title: Value(_title),
          tagline: Value(_tagline),
          voteAverage: Value(_voteAverage),
          voteCount: Value(_voteCount),
        );
        BlocProvider.of<LocalMovieCubit>(context)
          .addLocalMovie(MovieWithGenreCompanion(
            movie,
            _genres.entries.map((e) {
              return e.value;
            }).toList(),
          ));
        Application.router.navigateTo(context, '/', replace: true);
        break;
      case FormMode.EDIT:
        final movie = MoviesCompanion.insert(
          id: Value(widget.id!),
          adult: Value(_adult),
          backdropPath: Value('dummy'),
          budget: Value(_budget),
          originalLanguage: Value(_originalLanguage),
          originalTitle: Value(_originalTitle),
          overview: Value(_overview),
          popularity: Value(_popularity),
          posterPath: Value('dummy'),
          revenue: Value(_revenue),
          runtime: Value(_runtime),
          status: Value(_status),
          title: Value(_title),
          tagline: Value(_tagline),
          voteAverage: Value(_voteAverage),
          voteCount: Value(_voteCount),
        );
        BlocProvider.of<LocalMovieCubit>(context)
          .editLocalMovie(MovieWithGenreCompanion(
            movie,
            _genres.entries.map((e) {
              return e.value;
            }).toList(),
          ));
        Application.router.pop(context);
        break;
      default:
    }
  }

  @override
  void initState() {
    BlocProvider.of<LocalGenreCubit>(context)
        .getAllLocalGenre();

    switch (widget.formMode) {
      case FormMode.CREATE:
        break;
      case FormMode.EDIT:
        BlocProvider.of<LocalMovieCubit>(context)
            .getDetailLocalMovie(widget.id!);
        break;
      default:
    }
    super.initState();
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
          titleSpacing: 0.0,
          title: Text(
            widget.formMode == FormMode.CREATE ? 'Create' : 'Edit',
            style: TextStyle(
              color: Colors.black87
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 30.0,
              ),
              child: CustomTextButton(
                onPressed: () {
                  _saveData();
                },
                text: 'Save'
              ),
            ),
          ],
        ),
        body: BlocBuilder<LocalMovieCubit, LocalMovieState>(
          builder: (context, state) {
            if (state is LocalMovieLoadSuccess) {
              if (widget.formMode == FormMode.EDIT) {
                _fillInput(state.movie!);
              }
              
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
                      // child: ,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  CustomTextButton(
                    onPressed: () {
                      
                    },
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    text: 'Pick Image'
                  ),
                  Divider(),
                  CustomTextButton(
                    onPressed: () {
                      _checkBoxDialog();
                    },
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    backgroundColor: Colors.black54,
                    text: 'Genres'
                  ),
                  SizedBox(height: 10.0),
                  Divider(),
                  SizedBox(height: 20.0),
                  CustomTextField(
                    controller: _titleController,
                    hintText: 'Title',
                    onChanged: (val) {
                      _title = val;
                    },
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Switch(
                        value: _adult, 
                        onChanged: (val) {
                          setState(() {
                            _adult = val;
                          });
                        }
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Adult',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black54
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _budgetController,
                    hintText: 'Budget',
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      _budget = int.parse(val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _originalLanguageController,
                    hintText: 'Original language',
                    onChanged: (val) {
                      _originalLanguage = val;
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _originalTitleController,
                    hintText: 'Original title',
                    onChanged: (val) {
                      _originalTitle = val;
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _overviewController,
                    hintText: 'Overview',
                    onChanged: (val) {
                      _overview = val;
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _popularityController,
                    hintText: 'Popularity',
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      _popularity = double.parse(val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _revenueController,
                    hintText: 'Revenue',
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      _revenue = int.parse(val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _runtimeController,
                    hintText: 'Runtime',
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      _runtime = int.parse(val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _statusController,
                    hintText: 'Status',
                    onChanged: (val) {
                      _status = val;
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _taglineController,
                    hintText: 'Tagline',
                    onChanged: (val) {
                      _tagline = val;
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _voteAverageController,
                    hintText: 'Vote average',
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      _voteAverage = double.parse(val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: _voteCountController,
                    hintText: 'voteCount',
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      _voteCount = int.parse(val);
                    },
                  ),
                  SizedBox(height: 10.0),

                ],
              ); 
            }

            return Container();
          }
        ),
      ),
    );
  }
}
