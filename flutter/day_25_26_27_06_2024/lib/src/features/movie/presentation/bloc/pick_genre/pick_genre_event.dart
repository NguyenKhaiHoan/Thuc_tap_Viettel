part of 'pick_genre_bloc.dart';

abstract class PickGenreEvent extends Equatable {
  const PickGenreEvent();

  @override
  List<Object> get props => [];
}

class AddGenre extends PickGenreEvent {
  const AddGenre(this.genre);
  final GenreEntity genre;

  @override
  List<Object> get props => [genre];
}

class RemoveGenre extends PickGenreEvent {
  const RemoveGenre(this.genre);
  final GenreEntity genre;

  @override
  List<Object> get props => [genre];
}
