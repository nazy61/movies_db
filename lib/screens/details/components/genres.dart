import 'package:flutter/material.dart';

import 'package:movie_info_app/components/genre_card.dart';
import '../../../constants.dart';

class Genres extends StatelessWidget {
  const Genres({
    Key key,
    @required this.genra,
  }) : super(key: key);

  final List<String> genra;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genra.length,
          itemBuilder: (context, index) => GenreCard(
            genre: genra[index],
          ),
        ),
      ),
    );
  }
}
