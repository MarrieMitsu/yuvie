import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yuvie/data/models/api/search_movie_api_model.dart';
import 'package:yuvie/data/services/api/api.dart';
import 'package:yuvie/utils/dio_client.dart';

import 'movies_api_test.mocks.dart';

class MockDioClient extends MockDio implements DioClient {
  MockDio _dio = MockDio();

  Dio get dio => _dio;

  // with interceptor
  Dio withInterceptor() {
    return _dio;
  }
}

@GenerateMocks([Dio])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  late MockDioClient dioClient;
  late SearchApiImpl moviesApi;
  final sample =
      File('test/fixtures/search_movies.json').readAsStringSync();

  setUp(() {
    dioClient = MockDioClient();
    moviesApi = SearchApiImpl(dioClient);
  });

  void dioSuccess200() {
    when(dioClient.withInterceptor().get('/search/movie', queryParameters: {}))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: '/search/movie'),
              data: json.decode(sample),
              statusCode: 200,
            ));
  }

  test('search movies', () async {
    dioSuccess200();

    final result = await moviesApi.searchMovies({});
    final matcher = SearchMovieApiModel.fromJson(json.decode(sample));

    expect(result, equals(matcher));

    verify(dioClient.withInterceptor().get('/search/movie', queryParameters: {}));
  });
}
