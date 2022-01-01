// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Movie extends DataClass implements Insertable<Movie> {
  final int id;
  final bool? adult;
  final String? backdropPath;
  final int? budget;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String? status;
  final String? title;
  final String? tagline;
  final double? voteAverage;
  final int? voteCount;
  Movie(
      {required this.id,
      this.adult,
      this.backdropPath,
      this.budget,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.status,
      this.title,
      this.tagline,
      this.voteAverage,
      this.voteCount});
  factory Movie.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Movie(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      adult: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}adult']),
      backdropPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path']),
      budget: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}budget']),
      originalLanguage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}original_language']),
      originalTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}original_title']),
      overview: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}overview']),
      popularity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity']),
      posterPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path']),
      releaseDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date']),
      revenue: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}revenue']),
      runtime: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}runtime']),
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      tagline: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tagline']),
      voteAverage: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average']),
      voteCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_count']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || adult != null) {
      map['adult'] = Variable<bool?>(adult);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String?>(backdropPath);
    }
    if (!nullToAbsent || budget != null) {
      map['budget'] = Variable<int?>(budget);
    }
    if (!nullToAbsent || originalLanguage != null) {
      map['original_language'] = Variable<String?>(originalLanguage);
    }
    if (!nullToAbsent || originalTitle != null) {
      map['original_title'] = Variable<String?>(originalTitle);
    }
    if (!nullToAbsent || overview != null) {
      map['overview'] = Variable<String?>(overview);
    }
    if (!nullToAbsent || popularity != null) {
      map['popularity'] = Variable<double?>(popularity);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String?>(posterPath);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String?>(releaseDate);
    }
    if (!nullToAbsent || revenue != null) {
      map['revenue'] = Variable<int?>(revenue);
    }
    if (!nullToAbsent || runtime != null) {
      map['runtime'] = Variable<int?>(runtime);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String?>(status);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || tagline != null) {
      map['tagline'] = Variable<String?>(tagline);
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<double?>(voteAverage);
    }
    if (!nullToAbsent || voteCount != null) {
      map['vote_count'] = Variable<int?>(voteCount);
    }
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: Value(id),
      adult:
          adult == null && nullToAbsent ? const Value.absent() : Value(adult),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      budget:
          budget == null && nullToAbsent ? const Value.absent() : Value(budget),
      originalLanguage: originalLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(originalLanguage),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      revenue: revenue == null && nullToAbsent
          ? const Value.absent()
          : Value(revenue),
      runtime: runtime == null && nullToAbsent
          ? const Value.absent()
          : Value(runtime),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      tagline: tagline == null && nullToAbsent
          ? const Value.absent()
          : Value(tagline),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movie(
      id: serializer.fromJson<int>(json['id']),
      adult: serializer.fromJson<bool?>(json['adult']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      budget: serializer.fromJson<int?>(json['budget']),
      originalLanguage: serializer.fromJson<String?>(json['originalLanguage']),
      originalTitle: serializer.fromJson<String?>(json['originalTitle']),
      overview: serializer.fromJson<String?>(json['overview']),
      popularity: serializer.fromJson<double?>(json['popularity']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      releaseDate: serializer.fromJson<String?>(json['releaseDate']),
      revenue: serializer.fromJson<int?>(json['revenue']),
      runtime: serializer.fromJson<int?>(json['runtime']),
      status: serializer.fromJson<String?>(json['status']),
      title: serializer.fromJson<String?>(json['title']),
      tagline: serializer.fromJson<String?>(json['tagline']),
      voteAverage: serializer.fromJson<double?>(json['voteAverage']),
      voteCount: serializer.fromJson<int?>(json['voteCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'adult': serializer.toJson<bool?>(adult),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'budget': serializer.toJson<int?>(budget),
      'originalLanguage': serializer.toJson<String?>(originalLanguage),
      'originalTitle': serializer.toJson<String?>(originalTitle),
      'overview': serializer.toJson<String?>(overview),
      'popularity': serializer.toJson<double?>(popularity),
      'posterPath': serializer.toJson<String?>(posterPath),
      'releaseDate': serializer.toJson<String?>(releaseDate),
      'revenue': serializer.toJson<int?>(revenue),
      'runtime': serializer.toJson<int?>(runtime),
      'status': serializer.toJson<String?>(status),
      'title': serializer.toJson<String?>(title),
      'tagline': serializer.toJson<String?>(tagline),
      'voteAverage': serializer.toJson<double?>(voteAverage),
      'voteCount': serializer.toJson<int?>(voteCount),
    };
  }

  Movie copyWith(
          {int? id,
          bool? adult,
          String? backdropPath,
          int? budget,
          String? originalLanguage,
          String? originalTitle,
          String? overview,
          double? popularity,
          String? posterPath,
          String? releaseDate,
          int? revenue,
          int? runtime,
          String? status,
          String? title,
          String? tagline,
          double? voteAverage,
          int? voteCount}) =>
      Movie(
        id: id ?? this.id,
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        budget: budget ?? this.budget,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        revenue: revenue ?? this.revenue,
        runtime: runtime ?? this.runtime,
        status: status ?? this.status,
        title: title ?? this.title,
        tagline: tagline ?? this.tagline,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('budget: $budget, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('revenue: $revenue, ')
          ..write('runtime: $runtime, ')
          ..write('status: $status, ')
          ..write('title: $title, ')
          ..write('tagline: $tagline, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      adult,
      backdropPath,
      budget,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      revenue,
      runtime,
      status,
      title,
      tagline,
      voteAverage,
      voteCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          other.id == this.id &&
          other.adult == this.adult &&
          other.backdropPath == this.backdropPath &&
          other.budget == this.budget &&
          other.originalLanguage == this.originalLanguage &&
          other.originalTitle == this.originalTitle &&
          other.overview == this.overview &&
          other.popularity == this.popularity &&
          other.posterPath == this.posterPath &&
          other.releaseDate == this.releaseDate &&
          other.revenue == this.revenue &&
          other.runtime == this.runtime &&
          other.status == this.status &&
          other.title == this.title &&
          other.tagline == this.tagline &&
          other.voteAverage == this.voteAverage &&
          other.voteCount == this.voteCount);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> id;
  final Value<bool?> adult;
  final Value<String?> backdropPath;
  final Value<int?> budget;
  final Value<String?> originalLanguage;
  final Value<String?> originalTitle;
  final Value<String?> overview;
  final Value<double?> popularity;
  final Value<String?> posterPath;
  final Value<String?> releaseDate;
  final Value<int?> revenue;
  final Value<int?> runtime;
  final Value<String?> status;
  final Value<String?> title;
  final Value<String?> tagline;
  final Value<double?> voteAverage;
  final Value<int?> voteCount;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.budget = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.popularity = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.revenue = const Value.absent(),
    this.runtime = const Value.absent(),
    this.status = const Value.absent(),
    this.title = const Value.absent(),
    this.tagline = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.id = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.budget = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.overview = const Value.absent(),
    this.popularity = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.revenue = const Value.absent(),
    this.runtime = const Value.absent(),
    this.status = const Value.absent(),
    this.title = const Value.absent(),
    this.tagline = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.voteCount = const Value.absent(),
  });
  static Insertable<Movie> custom({
    Expression<int>? id,
    Expression<bool?>? adult,
    Expression<String?>? backdropPath,
    Expression<int?>? budget,
    Expression<String?>? originalLanguage,
    Expression<String?>? originalTitle,
    Expression<String?>? overview,
    Expression<double?>? popularity,
    Expression<String?>? posterPath,
    Expression<String?>? releaseDate,
    Expression<int?>? revenue,
    Expression<int?>? runtime,
    Expression<String?>? status,
    Expression<String?>? title,
    Expression<String?>? tagline,
    Expression<double?>? voteAverage,
    Expression<int?>? voteCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (adult != null) 'adult': adult,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (budget != null) 'budget': budget,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (originalTitle != null) 'original_title': originalTitle,
      if (overview != null) 'overview': overview,
      if (popularity != null) 'popularity': popularity,
      if (posterPath != null) 'poster_path': posterPath,
      if (releaseDate != null) 'release_date': releaseDate,
      if (revenue != null) 'revenue': revenue,
      if (runtime != null) 'runtime': runtime,
      if (status != null) 'status': status,
      if (title != null) 'title': title,
      if (tagline != null) 'tagline': tagline,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (voteCount != null) 'vote_count': voteCount,
    });
  }

  MoviesCompanion copyWith(
      {Value<int>? id,
      Value<bool?>? adult,
      Value<String?>? backdropPath,
      Value<int?>? budget,
      Value<String?>? originalLanguage,
      Value<String?>? originalTitle,
      Value<String?>? overview,
      Value<double?>? popularity,
      Value<String?>? posterPath,
      Value<String?>? releaseDate,
      Value<int?>? revenue,
      Value<int?>? runtime,
      Value<String?>? status,
      Value<String?>? title,
      Value<String?>? tagline,
      Value<double?>? voteAverage,
      Value<int?>? voteCount}) {
    return MoviesCompanion(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      budget: budget ?? this.budget,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      status: status ?? this.status,
      title: title ?? this.title,
      tagline: tagline ?? this.tagline,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (adult.present) {
      map['adult'] = Variable<bool?>(adult.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String?>(backdropPath.value);
    }
    if (budget.present) {
      map['budget'] = Variable<int?>(budget.value);
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String?>(originalLanguage.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String?>(originalTitle.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String?>(overview.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double?>(popularity.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String?>(posterPath.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String?>(releaseDate.value);
    }
    if (revenue.present) {
      map['revenue'] = Variable<int?>(revenue.value);
    }
    if (runtime.present) {
      map['runtime'] = Variable<int?>(runtime.value);
    }
    if (status.present) {
      map['status'] = Variable<String?>(status.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (tagline.present) {
      map['tagline'] = Variable<String?>(tagline.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double?>(voteAverage.value);
    }
    if (voteCount.present) {
      map['vote_count'] = Variable<int?>(voteCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('budget: $budget, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('posterPath: $posterPath, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('revenue: $revenue, ')
          ..write('runtime: $runtime, ')
          ..write('status: $status, ')
          ..write('title: $title, ')
          ..write('tagline: $tagline, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('voteCount: $voteCount')
          ..write(')'))
        .toString();
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MoviesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  late final GeneratedColumn<bool?> adult = GeneratedColumn<bool?>(
      'adult', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (adult IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  late final GeneratedColumn<String?> backdropPath = GeneratedColumn<String?>(
      'backdrop_path', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _budgetMeta = const VerificationMeta('budget');
  late final GeneratedColumn<int?> budget = GeneratedColumn<int?>(
      'budget', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  final VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  late final GeneratedColumn<String?> originalLanguage =
      GeneratedColumn<String?>('original_language', aliasedName, true,
          typeName: 'TEXT',
          requiredDuringInsert: false,
          defaultValue: Constant(''));
  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  late final GeneratedColumn<String?> originalTitle = GeneratedColumn<String?>(
      'original_title', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: Constant(''));
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  late final GeneratedColumn<String?> overview = GeneratedColumn<String?>(
      'overview', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: Constant(''));
  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  late final GeneratedColumn<double?> popularity = GeneratedColumn<double?>(
      'popularity', aliasedName, true,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: Constant(0.0));
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  late final GeneratedColumn<String?> posterPath = GeneratedColumn<String?>(
      'poster_path', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: Constant(''));
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  late final GeneratedColumn<String?> releaseDate = GeneratedColumn<String?>(
      'release_date', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: Constant(_currentDate()));
  final VerificationMeta _revenueMeta = const VerificationMeta('revenue');
  late final GeneratedColumn<int?> revenue = GeneratedColumn<int?>(
      'revenue', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  final VerificationMeta _runtimeMeta = const VerificationMeta('runtime');
  late final GeneratedColumn<int?> runtime = GeneratedColumn<int?>(
      'runtime', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: Constant(''));
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: Constant(''));
  final VerificationMeta _taglineMeta = const VerificationMeta('tagline');
  late final GeneratedColumn<String?> tagline = GeneratedColumn<String?>(
      'tagline', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: Constant(''));
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  late final GeneratedColumn<double?> voteAverage = GeneratedColumn<double?>(
      'vote_average', aliasedName, true,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: Constant(0.0));
  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  late final GeneratedColumn<int?> voteCount = GeneratedColumn<int?>(
      'vote_count', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        adult,
        backdropPath,
        budget,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        revenue,
        runtime,
        status,
        title,
        tagline,
        voteAverage,
        voteCount
      ];
  @override
  String get aliasedName => _alias ?? 'movies';
  @override
  String get actualTableName => 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('adult')) {
      context.handle(
          _adultMeta, adult.isAcceptableOrUnknown(data['adult']!, _adultMeta));
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    }
    if (data.containsKey('budget')) {
      context.handle(_budgetMeta,
          budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta));
    }
    if (data.containsKey('original_language')) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableOrUnknown(
              data['original_language']!, _originalLanguageMeta));
    }
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    }
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity']!, _popularityMeta));
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('revenue')) {
      context.handle(_revenueMeta,
          revenue.isAcceptableOrUnknown(data['revenue']!, _revenueMeta));
    }
    if (data.containsKey('runtime')) {
      context.handle(_runtimeMeta,
          runtime.isAcceptableOrUnknown(data['runtime']!, _runtimeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('tagline')) {
      context.handle(_taglineMeta,
          tagline.isAcceptableOrUnknown(data['tagline']!, _taglineMeta));
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    }
    if (data.containsKey('vote_count')) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableOrUnknown(data['vote_count']!, _voteCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Movie.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

class Genre extends DataClass implements Insertable<Genre> {
  final int id;
  final String? name;
  Genre({required this.id, this.name});
  factory Genre.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Genre(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    return map;
  }

  GenresCompanion toCompanion(bool nullToAbsent) {
    return GenresCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Genre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Genre(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
    };
  }

  Genre copyWith({int? id, String? name}) => Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Genre(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Genre && other.id == this.id && other.name == this.name);
}

class GenresCompanion extends UpdateCompanion<Genre> {
  final Value<int> id;
  final Value<String?> name;
  const GenresCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenresCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<Genre> custom({
    Expression<int>? id,
    Expression<String?>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GenresCompanion copyWith({Value<int>? id, Value<String?>? name}) {
    return GenresCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $GenresTable extends Genres with TableInfo<$GenresTable, Genre> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GenresTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: Constant(''));
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'genres';
  @override
  String get actualTableName => 'genres';
  @override
  VerificationContext validateIntegrity(Insertable<Genre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Genre map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Genre.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GenresTable createAlias(String alias) {
    return $GenresTable(_db, alias);
  }
}

class MovieGenre extends DataClass implements Insertable<MovieGenre> {
  final int movie;
  final int genre;
  MovieGenre({required this.movie, required this.genre});
  factory MovieGenre.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MovieGenre(
      movie: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}movie'])!,
      genre: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}genre'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['movie'] = Variable<int>(movie);
    map['genre'] = Variable<int>(genre);
    return map;
  }

  MoviesGenresCompanion toCompanion(bool nullToAbsent) {
    return MoviesGenresCompanion(
      movie: Value(movie),
      genre: Value(genre),
    );
  }

  factory MovieGenre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieGenre(
      movie: serializer.fromJson<int>(json['movie']),
      genre: serializer.fromJson<int>(json['genre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'movie': serializer.toJson<int>(movie),
      'genre': serializer.toJson<int>(genre),
    };
  }

  MovieGenre copyWith({int? movie, int? genre}) => MovieGenre(
        movie: movie ?? this.movie,
        genre: genre ?? this.genre,
      );
  @override
  String toString() {
    return (StringBuffer('MovieGenre(')
          ..write('movie: $movie, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(movie, genre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieGenre &&
          other.movie == this.movie &&
          other.genre == this.genre);
}

class MoviesGenresCompanion extends UpdateCompanion<MovieGenre> {
  final Value<int> movie;
  final Value<int> genre;
  const MoviesGenresCompanion({
    this.movie = const Value.absent(),
    this.genre = const Value.absent(),
  });
  MoviesGenresCompanion.insert({
    required int movie,
    required int genre,
  })  : movie = Value(movie),
        genre = Value(genre);
  static Insertable<MovieGenre> custom({
    Expression<int>? movie,
    Expression<int>? genre,
  }) {
    return RawValuesInsertable({
      if (movie != null) 'movie': movie,
      if (genre != null) 'genre': genre,
    });
  }

  MoviesGenresCompanion copyWith({Value<int>? movie, Value<int>? genre}) {
    return MoviesGenresCompanion(
      movie: movie ?? this.movie,
      genre: genre ?? this.genre,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (movie.present) {
      map['movie'] = Variable<int>(movie.value);
    }
    if (genre.present) {
      map['genre'] = Variable<int>(genre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesGenresCompanion(')
          ..write('movie: $movie, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }
}

class $MoviesGenresTable extends MoviesGenres
    with TableInfo<$MoviesGenresTable, MovieGenre> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MoviesGenresTable(this._db, [this._alias]);
  final VerificationMeta _movieMeta = const VerificationMeta('movie');
  late final GeneratedColumn<int?> movie = GeneratedColumn<int?>(
      'movie', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _genreMeta = const VerificationMeta('genre');
  late final GeneratedColumn<int?> genre = GeneratedColumn<int?>(
      'genre', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [movie, genre];
  @override
  String get aliasedName => _alias ?? 'movies_genres';
  @override
  String get actualTableName => 'movies_genres';
  @override
  VerificationContext validateIntegrity(Insertable<MovieGenre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('movie')) {
      context.handle(
          _movieMeta, movie.isAcceptableOrUnknown(data['movie']!, _movieMeta));
    } else if (isInserting) {
      context.missing(_movieMeta);
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    } else if (isInserting) {
      context.missing(_genreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MovieGenre map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MovieGenre.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoviesGenresTable createAlias(String alias) {
    return $MoviesGenresTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MoviesTable movies = $MoviesTable(this);
  late final $GenresTable genres = $GenresTable(this);
  late final $MoviesGenresTable moviesGenres = $MoviesGenresTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [movies, genres, moviesGenres];
}
