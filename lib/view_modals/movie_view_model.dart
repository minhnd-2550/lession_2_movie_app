import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieViewModel with ChangeNotifier {
  final Movie _movie;

  MovieViewModel({required Movie movie}) : _movie = movie;

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
}