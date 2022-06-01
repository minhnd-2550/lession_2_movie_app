import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/screens/movies.dart';
import 'view_modals/movie_list_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => MovieListViewModel(),
            )
          ],
          child: const Movies(),
        ));
  }
}
