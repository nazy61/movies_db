import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_info_app/services/movie_services.dart';

part 'moviegenra_state.dart';

class MoviegenraCubit extends Cubit<MoviegenraState> {
  final MovieDBService _movieDBService;

  MoviegenraCubit(this._movieDBService) : super(MoviegenraInitial());

  Future<void> getMovieGenra(String genraUrl) async {
    try {
      emit(MoviegenraInitial());
      final genra = await _movieDBService.fetchMovieGenres(genraUrl);
      emit(MoviegenraLoaded(genra));
    } catch (e) {
      emit(MoviegenraError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
