part of 'pick_genre_bloc.dart';

sealed class PickGenreState extends Equatable {
  final List<GenreEntity>? pickedGenre;
  const PickGenreState(this.pickedGenre);

  @override
  List<Object> get props => [];
}

final class GenreAdded extends PickGenreState {
  const GenreAdded(super.pickedGenre);
  @override
  List<Object> get props => [pickedGenre!];
}

final class GenreRemoved extends PickGenreState {
  const GenreRemoved(super.pickedGenre);
  @override
  List<Object> get props => [pickedGenre!];
}
