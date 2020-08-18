import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import 'backdrop_rating.dart';

class Body extends StatelessWidget {
  final Movie movie;

  const Body({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        BackdropAndRating(size: size, movie: movie),
      ],
    );
  }
}
