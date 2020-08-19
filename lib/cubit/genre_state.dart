part of 'genre_cubit.dart';

@immutable
abstract class GenreState {
  const GenreState();
}

class GenreInitial extends GenreState {
  const GenreInitial();
}

class GenreLoading extends GenreState {
  const GenreLoading();
}

class GenreLoaded extends GenreState {
  final List<Genre> genres;
  const GenreLoaded(this.genres);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GenreLoaded && areListsEqual(o.genres, genres);
  }

  @override
  int get hashCode => genres.hashCode;

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

class GenreError extends GenreState {
  final String message;
  const GenreError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GenreError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
