import 'package:dio/dio.dart';
import 'package:movie_info_app/models/genre.dart';

import '../constants.dart';
import '../models/movie.dart';

abstract class MovieDBService {
  Future<List<Movie>> fetchMovies(String movieUrl, String genreUrl);
  Future<List<Genre>> fetchGenres(String url);
  Future<List<String>> fetchMovieGenres(String url);
}

class MovieDBRepository implements MovieDBService {
  @override
  Future<List<Movie>> fetchMovies(String movieUrl, String genreUrl) async {
    await fetchGenres(genreUrl);
    try {
      Response response = await Dio().get(movieUrl);
      final data = response.data['results'];
      print(data.length);
      for (int i = 0; i < data.length; i++) {
        String posterUrl =
            'https://image.tmdb.org/t/p/w500${data[i]['poster_path']}';
        String backdropUrl =
            'https://image.tmdb.org/t/p/w500${data[i]['backdrop_path']}';
        String movieGenreUrl =
            'https://api.themoviedb.org/3/movie/${data[i]['id']}?api_key=${apiKey}&language=en-US';

        Movie movie = Movie(
          id: data[i]['id'],
          backdrop: backdropUrl,
          genraUrl: movieGenreUrl,
          metascoreRating: data[i]['popularity'],
          numOfRatings: data[i]['vote_count'],
          plot: data[i]['overview'],
          poster: posterUrl,
          rating: data[i]['vote_average'],
          title: data[i]['title'],
          year: data[i]['release_date'],
        );
        movies.add(movie);
      }
    } catch (e) {
      print(e);
    }
    print(movies.length);
    return movies;
  }

  Future<List<Genre>> fetchGenres(String url) async {
    try {
      Response response = await Dio().get(url);
      final data = response.data['genres'];
      for (int i = 0; i < data.length; i++) {
        Genre genre = Genre(
          id: data[i]['id'],
          name: data[i]['name'],
        );
        genres.add(genre);
      }
    } catch (e) {
      print(e);
    }
    return genres;
  }

  Future<List<String>> fetchMovieGenres(String url) async {
    List<String> movieGenra = [];
    try {
      Response response = await Dio().get(url);
      final data = response.data['genres'];
      for (int i = 0; i < data.length; i++) {
        Genre genre = Genre(
          id: data[i]['id'],
          name: data[i]['name'],
        );
        movieGenra.add(genre.name);
      }
    } catch (e) {
      print(e);
    }
    return movieGenra;
  }
}
