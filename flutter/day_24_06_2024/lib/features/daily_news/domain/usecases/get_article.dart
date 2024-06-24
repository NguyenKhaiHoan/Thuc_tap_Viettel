import 'package:day_24_06_2024/core/resources/data_state.dart';
import 'package:day_24_06_2024/core/usecases/usecase.dart';
import 'package:day_24_06_2024/features/daily_news/domain/entities/article.dart';
import 'package:day_24_06_2024/features/daily_news/domain/repositories/article_repository.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticlesUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getTopHeadlinesNewsArticles();
  }
}
