part of 'remote_article_bloc.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exception;

  const RemoteArticleState({this.articles, this.exception});

  @override
  List<Object> get props => [articles!, exception!];
}

final class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

final class RemoteArticlesLoaded extends RemoteArticleState {
  const RemoteArticlesLoaded(List<ArticleEntity> articles)
      : super(articles: articles);
}

final class RemoteArticlesException extends RemoteArticleState {
  const RemoteArticlesException(DioException exception)
      : super(exception: exception);
}
