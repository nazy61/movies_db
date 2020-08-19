import 'package:dio/dio.dart';

import '../../models/genre.dart';

abstract class GenreService {
  Future<List<Genre>> fetchGenres(String url);
}

class GenreRepository implements GenreService {
  @override
  Future<List<Genre>> fetchGenres(String url) async {
    final List<Genre> genres = [];
    try {
      Response response = await Dio().get(url);
      final data = response.data['genres'];
      for (int i = 0; i < data.length; i++) {
        Genre genre = Genre(
          id: data[i]['id'],
          name: data[i]['name'],
        );
        genres.add(genre);
        print(genre.name);
      }
    } catch (e) {
      print(e);
    }
    return genres;
  }
}
