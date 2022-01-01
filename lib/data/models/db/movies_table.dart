part of '../../services/db/database.dart';

// Movies Table
class Movies extends Table {
  IntColumn get id => 
    integer().autoIncrement()();

  BoolColumn get adult => 
    boolean().nullable().withDefault(Constant(false))();

  TextColumn get backdropPath => 
    text().named('backdrop_path').nullable()();

  IntColumn get budget => 
    integer().nullable().withDefault(Constant(0))();

  TextColumn get originalLanguage => 
    text().named('original_language').nullable().withDefault(Constant(''))();

  TextColumn get originalTitle => 
    text().named('original_title').nullable().withDefault(Constant(''))();

  TextColumn get overview => 
    text().nullable().withDefault(Constant(''))();

  RealColumn get popularity => 
    real().nullable().withDefault(Constant(0.0))();

  TextColumn get posterPath => 
    text().named('poster_path').nullable().withDefault(Constant(''))();

  TextColumn get releaseDate => 
    text().named('release_date').nullable().withDefault(Constant(_currentDate()))();
  IntColumn get revenue => 
    integer().nullable().withDefault(Constant(0))();

  IntColumn get runtime => 
    integer().nullable().withDefault(Constant(0))();

  TextColumn get status => 
    text().nullable().withDefault(Constant(''))();

  TextColumn get title => 
    text().nullable().withDefault(Constant(''))();

  TextColumn get tagline => 
    text().nullable().withDefault(Constant(''))();

  RealColumn get voteAverage => 
    real().named('vote_average').nullable().withDefault(Constant(0.0))();

  IntColumn get voteCount => 
    integer().named('vote_count').nullable().withDefault(Constant(0))();

  // get current datetime
  String _currentDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);

    return formatted;
  }

}