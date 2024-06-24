import 'package:day_24_06_2024/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/constants_api.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getTopHeadlinesNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
