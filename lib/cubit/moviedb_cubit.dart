import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/movie.dart';
import '../services/movie/movie_services.dart';

part 'moviedb_state.dart';

class MoviedbCubit extends Cubit<MoviedbState> {
  final MovieDBService _movieDBService;

  MoviedbCubit(this._movieDBService) : super(MoviedbInitial());

  Future<void> getMovies(String movieUrl, String genreUrl) async {
    try {
      emit(MoviedbLoading());
      final movies = await _movieDBService.fetchMovies(movieUrl, genreUrl);
      emit(MoviedbLoaded(movies));
    } catch (e) {
      emit(MoviedbError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
