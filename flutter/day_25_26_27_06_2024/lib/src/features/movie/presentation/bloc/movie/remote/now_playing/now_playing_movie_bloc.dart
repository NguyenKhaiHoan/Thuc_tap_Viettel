import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/resources/data_state.dart';
import '../../../../../domain/entities/movie.dart';
import '../../../../../domain/usecases/get_now_playing_movie.dart';

part 'now_playing_movie_event.dart';
part 'now_playing_movie_state.dart';

class NowPlayingMovieBloc
    extends Bloc<NowPlayingMovieEvent, NowPlayingMovieState> {
  final GetNowPlayingMovieUseCase _getNowPlayingMovieUseCase;

  NowPlayingMovieBloc(this._getNowPlayingMovieUseCase)
      : super(const NowPlayingMovieLoading()) {
    on<GetNowPlayingMovies>(onGetNowPlayingMovies);
  }

  Future<void> onGetNowPlayingMovies(
      GetNowPlayingMovies event, Emitter<NowPlayingMovieState> emit) async {
    final dataState = await _getNowPlayingMovieUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(NowPlayingMovieSuccess(
        dataState.data!,
      ));
    }

    if (dataState is DataFailed) {
      emit(NowPlayingMovieException(dataState.exception!));
    }
  }
}
