import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_modals/movie_list_view_model.dart';
import '../widgets/movie_list.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<MovieListViewModel>(context, listen: false).movieList({});
    });
  }

  Widget _buildList(MovieListViewModel vs) {
    switch (vs.loadingStatus) {
      case LoadingStatus.searching:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MovieList(
            movies: vs.movies,
          ),
        );
      case LoadingStatus.empty:
      default:
        return const Center(
          child: Text("No results found"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var vs = Provider.of<MovieListViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Popular", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator( child: _buildList(vs), onRefresh: vs.onRefreshListener),
            ),
          ],
        ),
      ),
    );
  }
}
