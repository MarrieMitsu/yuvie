part of '../../services/db/database.dart';

// MoviesGenres Table
@DataClassName('MovieGenre')
class MoviesGenres extends Table {
  IntColumn get movie => integer()();
  IntColumn get genre => integer()();
}