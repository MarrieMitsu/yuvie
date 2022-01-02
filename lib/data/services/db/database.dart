import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../domain/entities/genre.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_detail.dart';

part '../../models/db/genres_table.dart';
part '../../models/db/movie_with_genres.dart';
part '../../models/db/movies_genres_table.dart';
part '../../models/db/movies_table.dart';
part 'database.g.dart';

// Open Connection
LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
}

// Database
@DriftDatabase(tables: [Movies, Genres, MoviesGenres])
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      if (details.wasCreated) {

        // seeding genres
        await batch((batch) => {
          batch.insertAll(genres, [
            GenresCompanion.insert(
              id: const Value(28),
              name: Value('Action')
            ),
            GenresCompanion.insert(
              id: const Value(12), 
              name: Value('Adventure')
            ),
            GenresCompanion.insert(
              id: const Value(16), 
              name: Value('Animation')
            ),
          ])
        });
      }

      // activate pragma
      await customStatement('PRAGMA foreign_keys = ON');
    }
  );

  // Get All Genre
  Future<List<Genre>> getAllGenre() async {
    return await select(genres).get();
  }

  // Count Movies
  Future<int> countMovies() async {
    Expression<int> countExp = movies.id.count();

    final query = selectOnly(movies)..addColumns([countExp]);

    return await query.map((row) => row.read(countExp)).getSingle();
  }

  // Get All Movie With Genre
  Future<List<MovieWithGenre>> getAllMovieWithGenre({int page = 1, int limit = 10}) async {
    final int offset = (page - 1) * limit;

    // get all movies and transform them to map
    // final moviesQuery = await (select(movies)..limit(limit, offset: offset)).get();
    
    // there's a problem when using limit and offset,
    // i'm affraid it was my mistake
    final moviesQuery = await select(movies).get();

    final idToMovies = {
      for (var movieQuery in moviesQuery)
        movieQuery.id: movieQuery
    };
    final ids = idToMovies.keys;

    // get all movies-genres by id
    final moviesGenresQuery = await (
      select(moviesGenres).join([
        innerJoin(
          genres,
          genres.id.equalsExp(moviesGenres.genre),
        ),
      ])..where(moviesGenres.movie.isIn(ids))
    ).get();
    final idToGenres = <int, List<Genre>>{};

    for (var row in moviesGenresQuery) {
      final genre = row.readTable(genres);
      final id = row.readTable(moviesGenres).movie;

      idToGenres.putIfAbsent(id, () => []).add(genre);
    }

    return [
      for (var id in ids) 
          MovieWithGenre(idToMovies[id]!, idToGenres[id] ?? []),
    ];

  }

  // Get Movie With Genre
  Future<MovieWithGenre> getMovieWithGenre(int movieId) async {
    // get movie
    final movieQuery = await (
      select(movies)
        ..where((tbl) => tbl.id.equals(movieId))
    ).getSingle();

    // get movies-genres by id
    final moviesGenresQuery = await (
      select(moviesGenres).join([
        innerJoin(
          genres, 
          genres.id.equalsExp(moviesGenres.genre)
        ),
      ])..where(moviesGenres.movie.equals(movieId))
    ).get();

    // get genres
    final genreQuery = moviesGenresQuery
      .map((row) => row.readTable(genres))
      .toList();

    return MovieWithGenre(movieQuery, genreQuery);
  }

  // Insert Movie
  Future<MovieWithGenre> insertMovie(MovieWithGenreCompanion entry) {
    return transaction(() async {
      final movieEntry = entry.movie;
      print('INSERTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT');

      // insert movie
      final id = await into(movies)
        .insert(movieEntry, mode: InsertMode.replace);

      // delete old movies-genres
      await (
        delete(moviesGenres)
          ..where((tbl) => tbl.movie.equals(id))
      ).go();

      // insert new movies-genres
      for (var item in entry.genres) {
        await into(moviesGenres)
          .insert(MovieGenre(movie: id, genre: item.id.value));
      }

      return await getMovieWithGenre(id);
    });
  }

  // Update Movie
  Future<MovieWithGenre> updateMovie(MovieWithGenreCompanion entry) {
    return transaction(() async {
      final movieEntry = entry.movie;

      // update movie
      final id = await (
        update(movies)
          ..where((tbl) => tbl.id.equals(movieEntry.id.value))
      ).write(movieEntry);

      // delete old movies-genres
      await (
        delete(moviesGenres)
          ..where((tbl) => tbl.movie.equals(id))
      ).go();

      // insert new movies-genres
      for (var item in entry.genres) {
        await into(moviesGenres)
            .insert(MovieGenre(movie: id, genre: item.id.value));
      }

      return await getMovieWithGenre(id);
    });
  }

  // Delete Movie
  Future<bool> deleteMovie(int movieId) {
    return transaction(() async {

      await (
        delete(movies)
          ..where((tbl) => tbl.id.equals(movieId))
      ).go();

      await (
        delete(moviesGenres)
          ..where((tbl) => tbl.movie.equals(movieId))
      ).go();

      return true;
    });
  }

}