part of '../../services/db/database.dart';

// Genres Table
class Genres extends Table {
  IntColumn get id => 
    integer()();

  TextColumn get name => 
    text().nullable().withDefault(Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

// this extension class located at 'database.g.dart'
extension GenreEntityMapper on Genre {
  GenreEntity toEntity() {
    return GenreEntity(
      id: id,
      name: name!,
    );
  }
}