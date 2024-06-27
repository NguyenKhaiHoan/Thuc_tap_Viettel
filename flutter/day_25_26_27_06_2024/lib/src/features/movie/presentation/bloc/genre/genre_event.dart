part of 'genre_bloc.dart';

abstract class GenreEvent {
  const GenreEvent();
}

class LoadGenre extends GenreEvent {
  const LoadGenre();
}
