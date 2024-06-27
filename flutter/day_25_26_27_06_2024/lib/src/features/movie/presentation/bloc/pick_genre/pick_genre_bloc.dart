import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:day_25_26_06_2024/src/features/movie/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/genre.dart';

part 'pick_genre_event.dart';
part 'pick_genre_state.dart';

class PickGenreBloc extends Bloc<PickGenreEvent, PickGenreState> {
  PickGenreBloc() : super(const GenreAdded([])) {
    on<PickGenreEvent>(onPickGenreEvent);
  }

  final List<GenreEntity> _genres = [];

  Future<void> onPickGenreEvent(
      PickGenreEvent event, Emitter<PickGenreState> emit) async {
    if (event is AddGenre) {
      _genres.add(event.genre);
      emit(GenreAdded(_genres));
    } else if (event is RemoveGenre) {
      _genres.remove(event.genre);
      emit(GenreRemoved(_genres));
    }
  }
}
