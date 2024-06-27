import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/resources/data_state.dart';
import '../../../../../domain/entities/movie.dart';
import '../../../../../domain/usecases/get_popular_movie.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovieUseCase _getPopularMovieUseCase;

  PopularMovieBloc(this._getPopularMovieUseCase)
      : super(const PopularMovieLoading()) {
    on<GetPopularMovies>(onGetPopularMovies);
  }

  Future<void> onGetPopularMovies(
      GetPopularMovies event, Emitter<PopularMovieState> emit) async {
    final dataState = await _getPopularMovieUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(PopularMovieSuccess(
        dataState.data!,
      ));
    }

    if (dataState is DataFailed) {
      emit(PopularMovieException(dataState.exception!));
    }
  }
}
