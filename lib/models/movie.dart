class Movie {
  final int? id;
  final String? title;
  final String? overview;
  final voteAverage;
  final String? releaseDate;
  final String? backdropPath;
  final String? posterPath;
  final List<dynamic>? genres;

  Movie(
      {this.genres,
      this.id,
      this.title,
      this.overview,
      this.voteAverage,
      this.releaseDate,
      this.backdropPath,
      this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      genres: json["genres"]?.map((x) => x).toList(),
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      releaseDate: json["release_date"],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
    );
  }
}