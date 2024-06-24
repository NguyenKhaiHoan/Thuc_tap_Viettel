import 'package:day_24_06_2024/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:day_24_06_2024/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter/material.dart';

import '../../features/daily_news/domain/entities/article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(DailyNews());
      case '/ArticleDetails':
        return _materialRoute(
            ArticleDetailsView(article: settings.arguments as ArticleEntity));
      default:
        return _materialRoute(DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
