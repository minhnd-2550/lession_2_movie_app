import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/Utils.dart';
import '../../view_modals/movie_view_model.dart';

class MovieDetail extends StatelessWidget {
  final MovieViewModel movie;

  const MovieDetail({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        child: Column(
          children: [
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      scale: 2.0,
                      image: NetworkImage(
                          getSmallImageUrl(imagePath: movie.backdropPath!))),
                ),
                width: double.infinity,
                height: 200,
              ),
              Positioned(
                top:0,
                left: 20.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            getSmallImageUrl(imagePath: movie.posterPath!))),
                  ),
                  width: 100,
                  height: 200,
                ),
              ),
            ]),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
                  child: Row(
                    children: [
                      Text(movie.title!),
                    ],
                  ),
                ),
                Table(
                    border: TableBorder.symmetric(
                        inside: const BorderSide(width: 1, color: Colors.grey),
                        outside:
                            const BorderSide(width: 1, color: Colors.grey)),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: const [
                              Icon(FontAwesomeIcons.comment),
                              Text("Reviews")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: const [
                              Icon(FontAwesomeIcons.circlePlay),
                              Text("Reviews")
                            ],
                          ),
                        ),
                      ]),
                    ]),
                Table(
                    border: const TableBorder(bottom: BorderSide(width: 1, color: Colors.grey, style: BorderStyle.solid)),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: const [Text("Genre"), Text("Reviews")],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: const [Text("Release"), Text("Reviews")],
                          ),
                        ),
                      ]),
                    ]),
                // Row(
                //   children: [
                //     Flexible(
                //       flex: 1,
                //       fit: FlexFit.tight,
                //       child: Column(
                //         children: const [Text("Genre"), Text("Reviews")],
                //       ),
                //     ),
                //     Flexible(
                //       flex: 1,
                //       fit: FlexFit.tight,
                //       child: Column(
                //         children: const [Text("Release"), Text("Reviews")],
                //       ),
                //     )
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(movie.overview!,
                      maxLines: 5, overflow: TextOverflow.ellipsis),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
