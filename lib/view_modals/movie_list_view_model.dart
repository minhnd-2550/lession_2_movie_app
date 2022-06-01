import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../services/web_service.dart';
import 'movie_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class MovieListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<MovieViewModel> movies = [];
  final _isRefreshing = false;
  var isLoading = false;
  final _firstPage = 1;

  get page => null;

  movieList(Object? params) async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<Movie> moviesList = await WebService().fetchPopularMovie(params);

    movies = moviesList
        .map((movie) => MovieViewModel(movie: movie))
        .toList();

    if (movies.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }

  Future onRefreshListener() async {
    await movieList({page: _firstPage});
  }
}