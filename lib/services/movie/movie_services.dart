import 'package:dio/dio.dart';

import '../../constants.dart';
import '../../models/movie.dart';

abstract class MovieDBService {
  Future<Movie> fetchMovies(String url);
}

class MovieDBRepository implements MovieDBService {
  @override
  Future<Movie> fetchMovies(String url) async {
    // TODO: implement getMovies
  }
}
