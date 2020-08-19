part of 'moviegenra_cubit.dart';

@immutable
abstract class MoviegenraState {
  const MoviegenraState();
}

class MoviegenraInitial extends MoviegenraState {
  const MoviegenraInitial();
}

class MoviegenraLoading extends MoviegenraState {
  const MoviegenraLoading();
}

class MoviegenraLoaded extends MoviegenraState {
  final List<String> genra;
  const MoviegenraLoaded(this.genra);

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

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MoviegenraLoaded && areListsEqual(o.genra, genra);
  }

  @override
  int get hashCode => genra.hashCode;
}

class MoviegenraError extends MoviegenraState {
  final String message;
  const MoviegenraError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MoviegenraError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
