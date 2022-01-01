import 'package:dio/dio.dart';

import '../../../utils/dio_client.dart';
import '../../../utils/exceptions.dart';
import '../../models/api/search_movie_api_model.dart';

// abstract
abstract class SearchApi {

  Future<SearchMovieApiModel> searchMovies(Map<String, dynamic>? qp);

}

// implementation
class SearchApiImpl implements SearchApi {
  // initialize
  final DioClient dioClient;

  SearchApiImpl(this.dioClient);

  @override
  Future<SearchMovieApiModel> searchMovies(Map<String, dynamic>? qp) async {
    Response response = await dioClient
      .withInterceptor()
      .get('/search/movie', queryParameters: qp);

    if (response.statusCode == 200) {
      return SearchMovieApiModel.fromJson(response.data);
    } else {
      throw ServerException;
    }
  }
}