import 'package:day_24_06_2024/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_24_06_2024/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/resources/data_state.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticlesUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticlesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesLoaded(dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.exception!);
      emit(RemoteArticlesException(dataState.exception!));
    }
  }
}
