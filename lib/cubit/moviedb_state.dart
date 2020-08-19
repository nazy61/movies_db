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
  final List<Movie> movies;
  const MoviedbLoaded(this.movies);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MoviedbLoaded && areListsEqual(o.movies, movies);
  }

  @override
  int get hashCode => movies.hashCode;

  bool areListsEqual(var list1, var list2) {
    // check if both are lists
    if (!(list1 is List && list2 is List)
        // check if both have same length
        ||
        list1.length != list2.length) {
      return false;
    }

    // check if elements are equal
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        return false;
      }
    }

    return true;
  }
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
