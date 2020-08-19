part of 'moviedb_cubit.dart';

@immutable
abstract class MoviedbState {
  const MoviedbState();
}

class MoviedbInitial extends MoviedbState {
  const MoviedbInitial();
}

class MoviedbLoading extends MoviedbState {
  const MoviedbLoading();
}

class MoviedbLoaded extends MoviedbState {
  final Movie movie;
  const MoviedbLoaded(this.movie);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MoviedbLoaded && o.movie == movie;
  }

  @override
  int get hashCode => movie.hashCode;
}

class MoviedbError extends MoviedbState {
  final String message;
  const MoviedbError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MoviedbError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
