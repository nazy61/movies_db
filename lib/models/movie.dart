import 'package:flutter/foundation.dart';

// Our movie model
class Movie {
  final dynamic id, numOfRatings, rating, metascoreRating;
  final String plot, title, poster, backdrop, year, genraUrl;

  Movie({
    @required this.poster,
    @required this.backdrop,
    @required this.title,
    @required this.id,
    @required this.year,
    @required this.numOfRatings,
    @required this.metascoreRating,
    @required this.rating,
    @required this.genraUrl,
    @required this.plot,
  });
}

// our demo data movie data
List<Movie> movies = [];

var cast = [
  {
    "orginalName": "James Mangold",
    "movieName": "Director",
    "image": "assets/images/actor_1.png",
  },
  {
    "orginalName": "Matt Damon",
    "movieName": "Carroll",
    "image": "assets/images/actor_2.png",
  },
  {
    "orginalName": "Christian Bale",
    "movieName": "Ken Miles",
    "image": "assets/images/actor_3.png",
  },
  {
    "orginalName": "Caitriona Balfe",
    "movieName": "Mollie",
    "image": "assets/images/actor_4.png",
  },
];
