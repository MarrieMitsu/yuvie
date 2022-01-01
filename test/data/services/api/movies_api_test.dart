import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yuvie/data/models/api/movies_get_details_api_model.dart';
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
  late MoviesApiImpl moviesApi;
  final sample =
      File('test/fixtures/movie_get_details.json').readAsStringSync();

  setUp(() {
    dioClient = MockDioClient();
    moviesApi = MoviesApiImpl(dioClient);
  });

  void dioSuccess200() {
    when(dioClient.withInterceptor().get('/movie/550', queryParameters: {}))
        .thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: '/movie/550'),
            data: json.decode(sample),
            statusCode: 200,
        )
    );
  }

  test('get movies details', () async {
    dioSuccess200();

    final result = await moviesApi.getDetails(550, {});
    final matcher = MoviesGetDetailsApiModel.fromJson(json.decode(sample));

    expect(result, equals(matcher));

    verify(dioClient.withInterceptor().get('/movie/550', queryParameters: {}));
  });
}
