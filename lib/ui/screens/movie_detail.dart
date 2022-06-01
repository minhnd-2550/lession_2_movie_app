import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lession_2_movie_app/models/movie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../services/web_service.dart';
import '../../utils/Utils.dart';
import '../../view_modals/movie_view_model.dart';

class MovieDetail extends StatefulWidget {
  final MovieViewModel movie;

  const MovieDetail({required this.movie});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<Movie> futureMovieDetails;
  @override
  void initState() {
    super.initState();
    futureMovieDetails = WebService().fetchDetailMovie(widget.movie.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movie Detail",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.angleLeft,
            size: 29,
            color: Colors.blueAccent,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: FutureBuilder<Movie>(
            future: futureMovieDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var genres = snapshot.data!.genres!
                    .map((v) => v['name'])
                    .toList()
                    .join(', ');
                return Column(
                  children: [
                    Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              scale: 2.0,
                              image: NetworkImage(getSmallImageUrl(
                                  imagePath: snapshot.data!.backdropPath!))),
                        ),
                        width: double.infinity,
                        height: 200,
                      ),
                      Positioned(
                        bottom: -20,
                        left: 20.0,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(getSmallImageUrl(
                                    imagePath: snapshot.data!.posterPath!))),
                          ),
                          width: 100,
                          height: 200,
                        ),
                      ),
                    ]),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 9,
                                  child: Text(
                                    snapshot.data!.title!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Flexible(
                                flex: 2,
                                child: CircularPercentIndicator(
                                  radius: 16.0,
                                  lineWidth: 4.0,
                                  percent: snapshot.data!.voteAverage! / 10,
                                  center:
                                      Text('${snapshot.data!.voteAverage!}'),
                                  progressColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Table(
                            border: TableBorder.symmetric(
                                inside: const BorderSide(
                                    width: 1, color: Colors.grey),
                                outside: const BorderSide(
                                    width: 1, color: Colors.grey)),
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: const [
                                      Icon(
                                        FontAwesomeIcons.comment,
                                        color: Color.fromRGBO(71, 184, 164, 1),
                                      ),
                                      SizedBox(height: 6),
                                      Text('Reviews')
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: const [
                                      Icon(FontAwesomeIcons.circlePlay,
                                          color:
                                              Color.fromRGBO(225, 108, 96, 1)),
                                      SizedBox(height: 6),
                                      Text("Trailers")
                                    ],
                                  ),
                                ),
                              ]),
                            ]),
                        Table(
                            border: const TableBorder(
                                bottom: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                    style: BorderStyle.solid)),
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Genre",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        genres,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(22.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Release",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(snapshot.data!.releaseDate!)
                                    ],
                                  ),
                                ),
                              ]),
                            ]),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            widget.movie.overview!,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ],
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
