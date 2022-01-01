// abstract
import 'package:dio/dio.dart';
import 'package:yuvie/data/models/api/movies_get_details_api_model.dart';

import '../../../utils/dio_client.dart';
import '../../../utils/exceptions.dart';

abstract class MoviesApi {

  Future<MoviesGetDetailsApiModel> getDetails(int movieId, Map<String, dynamic>? qp);

}

// implementation
class MoviesApiImpl implements MoviesApi {
  // intialize
  final DioClient dioClient;

  MoviesApiImpl(this.dioClient);

  @override
  Future<MoviesGetDetailsApiModel> getDetails(int movieId, Map<String, dynamic>? qp) async {
    Response response = await dioClient
      .withInterceptor()
      .get('/movie/$movieId', queryParameters: qp);

    if (response.statusCode == 200) {
      return MoviesGetDetailsApiModel.fromJson(response.data);
    } else {
      throw ServerException;
    }
  }

}