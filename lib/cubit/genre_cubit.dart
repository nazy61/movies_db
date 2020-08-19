import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/genre.dart';
import '../services/genre/genre_service.dart';
part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final GenreService _genreService;

  GenreCubit(this._genreService) : super(GenreInitial());

  Future<void> getGenres(String url) async {
    try {
      emit(GenreLoading());
      final genres = await _genreService.fetchGenres(url);
      emit(GenreLoaded(genres));
    } catch (e) {
      emit(GenreError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
