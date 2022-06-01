import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../services/web_service.dart';

class MovieViewModel with ChangeNotifier {
  final Movie _movie;
  MovieViewModel({Movie? movie}) : _movie = movie!;
  var movieDetail;

  int? get id {
    return _movie.id;
  }

  String? get title {
    return _movie.title;
  }

  String? get overview {
    return _movie.overview;
  }

  int? get voteAverage {
    return _movie.voteAverage;
  }

  String? get backdropPath {
    return _movie.backdropPath;
  }

  String? get posterPath {
    return _movie.posterPath;
  }

  fetchMovieDetail(int movieId) async {
    Movie movieDetail = await WebService().fetchDetailMovie(movieId);
    movieDetail = movieDetail;
    notifyListeners();
  }
}
