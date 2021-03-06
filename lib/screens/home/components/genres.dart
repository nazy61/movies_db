import 'package:flutter/material.dart';
import 'package:movie_info_app/components/genre_card.dart';
import 'package:movie_info_app/models/genre.dart';

import '../../../constants.dart';

class Genres extends StatelessWidget {
  final List<Genre> genres;

  const Genres({Key key, this.genres}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => GenreCard(genre: genres[index].name),
      ),
    );
  }
}
