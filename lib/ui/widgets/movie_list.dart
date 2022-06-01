import 'package:flutter/material.dart';

import '../../utils/Utils.dart';
import '../../view_modals/movie_view_model.dart';
import '../screens/movie_detail.dart';

class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;

  const MovieList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];

        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, movie);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          // fit: BoxFit.cover,
                          // scale: 2.0,
                          image: NetworkImage(
                              getSmallImageUrl(imagePath: movie.posterPath!)),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    height: 180,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListTile(
                    title: Text(
                      movie.title!,
                      style: const TextStyle(fontSize: 22),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        movie.overview!,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showNewsArticleDetails(BuildContext context, MovieViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return MovieDetail(movie: vm);
    }));
  }
}
