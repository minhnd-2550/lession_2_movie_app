class Movie {
  final String? title;
  final String? overview;
  final voteAverage;
  final String? releaseDate;
  final String? backdropPath;
  final String? posterPath;

  Movie(
      {this.title,
        this.overview,
        this.voteAverage,
        this.releaseDate,
        this.backdropPath,
        this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
    );
  }
}