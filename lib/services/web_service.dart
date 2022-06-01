import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/movie.dart';
import '../utils/Constants.dart';

class WebService {
  var dio = Dio();

  Future<List<Movie>> fetchPopularMovie(Object? params) async {
    final response = await dio.get('${ApiConst.BASE_URL}${ApiConst.MOVIE_POPULAR}?api_key=${ApiConst.API_KEY}');

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['results'];
      return list.map((article) => Movie.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }

  Future<Movie> fetchDetailMovie(int? movieId) async {
    final response = await dio.get('${ApiConst.BASE_URL}${ApiConst.MOVIE}$movieId?api_key=${ApiConst.API_KEY}');

    if (response.statusCode == 200) {
      final result = response.data;
      return Movie.fromJson(jsonDecode(result));
    } else {
      throw Exception("Failed to get top news");
    }
  }
}