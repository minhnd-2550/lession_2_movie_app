import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
            'https://image.tmdb.org/t/p/original/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'),
        Column(
          children: const [
            Text("Morbius"),
            Text(
                "angerously ill with a rare blood disorder, and determined to save others suffering his same fate, Dr. Michael Morbius attempts a desperate gamble. What at first appears to be a radical success soon reveals itself to be a remedy potentially worse than the disease.")
          ],
        )
      ],
    );
  }
}
