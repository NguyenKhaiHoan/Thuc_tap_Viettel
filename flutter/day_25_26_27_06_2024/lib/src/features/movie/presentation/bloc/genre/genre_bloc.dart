import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_25_26_06_2024/src/features/movie/data/models/genre.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/genre.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(const GenreLoading()) {
    on<LoadGenre>(onLoadGenre);
  }

  Future<void> onLoadGenre(LoadGenre event, Emitter<GenreState> emit) async {
    var results = genrelist.map((genre) => GenreModel.fromJson(genre)).toList();
    await Future.delayed(const Duration(seconds: 1));
    emit(GenreSuccess(results));
  }
}
