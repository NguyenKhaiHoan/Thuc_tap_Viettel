import 'dart:io';

import 'package:day_24_06_2024/core/constants/constants_api.dart';
import 'package:day_24_06_2024/core/resources/data_state.dart';
import 'package:day_24_06_2024/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:dio/dio.dart';
import '../../domain/repositories/article_repository.dart';
import '../models/article.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getTopHeadlinesNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getTopHeadlinesNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
