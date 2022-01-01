import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:yuvie/data/services/db/database.dart';

void main() {
  late Database db;

  setUp(() {
    db = Database(NativeDatabase.memory());
  });

  test('seeding and get all genres', () async {
    final result = await db.getAllGenre();

    final matcher = <Genre>[
      Genre(id: 12, name: 'Adventure'),
      Genre(id: 16, name: 'Animation'),
      Genre(id: 28, name: 'Action'),
    ];

    expect(result, matcher);
  });

  test('sequentially create, read, update, delete', () async {
    // initialize
    final insertGenresInstance = <GenresCompanion>[
      GenresCompanion.insert(id: Value(12)),
      GenresCompanion.insert(id: Value(16)),
    ];
    final insertGenreResult = <Genre>[
      Genre(id: 12, name: 'Adventure'),
      Genre(id: 16, name: 'Animation'),
    ];
    final insertMovieInstance = MoviesCompanion.insert(
      adult: Value(false),
      backdropPath: Value('path'),
      budget: Value(10000),
      originalLanguage: Value('en'),
      originalTitle: Value('Whoops'),
      overview: Value('nothing'),
      popularity: Value(1.5),
      posterPath: Value('path'),
      releaseDate: Value('2022-04-12'),
      revenue: Value(10000),
      runtime: Value(10000),
      status: Value('launch'),
      title: Value('Whoops'),
      tagline: Value('i have no idea'),
      voteAverage: Value(7.6),
      voteCount: Value(2000),
    );
    final insertMovieResult = Movie(
      id: 1,
      adult: false,
      backdropPath: 'path',
      budget: 10000,
      originalLanguage: 'en',
      originalTitle: 'Whoops',
      overview: 'nothing',
      popularity: 1.5,
      posterPath: 'path',
      releaseDate: '2022-04-12',
      revenue: 10000,
      runtime: 10000,
      status: 'launch',
      title: 'Whoops',
      tagline: 'i have no idea',
      voteAverage: 7.6,
      voteCount: 2000,
    );

    final updateGenresInstance = <GenresCompanion>[
      GenresCompanion.insert(id: Value(12)),
    ];
    final updateGenreResult = <Genre>[
      Genre(id: 12, name: 'Adventure'),
    ];
    final updateMovieInstance = MoviesCompanion.insert(
      id: Value(1),
      tagline: Value('I have no idea'),
    );
    final updateMovieResult = Movie(
      id: 1,
      adult: false,
      backdropPath: 'path',
      budget: 10000,
      originalLanguage: 'en',
      originalTitle: 'Whoops',
      overview: 'nothing',
      popularity: 1.5,
      posterPath: 'path',
      releaseDate: '2022-04-12',
      revenue: 10000,
      runtime: 10000,
      status: 'launch',
      title: 'Whoops',
      tagline: 'I have no idea',
      voteAverage: 7.6,
      voteCount: 2000,
    );

    // insert
    final insertResult = await db
      .insertMovie(MovieWithGenreCompanion(insertMovieInstance, insertGenresInstance));
    expect(insertResult, MovieWithGenre(insertMovieResult, insertGenreResult));
    expect(insertResult.movie.id, 1);
    expect(insertResult.movie.title, 'Whoops');
    expect(insertResult.genres.length, 2);

    // update previous insert
    final updateResult = await db
      .updateMovie(MovieWithGenreCompanion(updateMovieInstance, updateGenresInstance));
    expect(updateResult, MovieWithGenre(updateMovieResult, updateGenreResult));
    expect(updateResult.movie.id, 1);
    expect(updateResult.movie.tagline, 'I have no idea');
    expect(updateResult.genres.length, 1);

    // delete row with id '1'
    final deleteResult = await db.deleteMovie(1);
    expect(deleteResult, true);

  });

  tearDown(() async {
    await db.close();
  });
}