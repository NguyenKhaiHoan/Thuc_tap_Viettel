import 'package:day_24_06_2024/core/resources/data_state.dart';
import 'package:day_24_06_2024/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getTopHeadlinesNewsArticles();
}
