import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Dio client
class DioClient {
  // initialize
  DioClient() {
    _dio = Dio(_options);
  }

  Dio _dio = Dio();

  // base options
  BaseOptions _options = BaseOptions(
    baseUrl: dotenv.env['APP_ENV'] == 'production' ? dotenv.env['PROD_API_URL']! : dotenv.env['DEV_API_URL']!,
    connectTimeout: 15000,
    receiveTimeout: 13000
  );

  // interceptor
  InterceptorsWrapper _interceptor = InterceptorsWrapper(
    onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        return handler.next(response);
      },
      onError: (DioError e, handler) async {
        return handler.next(e);
      } 
  );

  Dio get dio => _dio;

  // with interceptor 
  Dio withInterceptor() {
    _dio.interceptors.add(_interceptor);
    return _dio;
  }

}
