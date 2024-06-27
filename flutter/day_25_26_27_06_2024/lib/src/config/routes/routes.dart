import 'package:day_25_26_06_2024/src/features/auth/presentation/pages/login/login.dart';
import 'package:day_25_26_06_2024/src/features/auth/presentation/pages/sign_up/sign_up.dart';
import 'package:day_25_26_06_2024/src/features/auth/presentation/pages/welcome/welcome.dart';
import 'package:day_25_26_06_2024/src/features/movie/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../features/movie/presentation/pages/detail/movie_detail.dart';
import '../../features/movie/presentation/pages/home/home.dart';
import '../../features/movie/presentation/pages/process/process.dart';
import '../../features/movie/presentation/pages/see_all/popular_movie.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const WelcomePage());

      case '/MovieDetail':
        return _materialRoute(
            MovieDetailPage(movie: settings.arguments as MovieEntity));

      case '/SeeAll':
        return _materialRoute(SeeAllPopularMovie(
            movies: settings.arguments as List<MovieEntity>));

      case '/Home':
        return _materialRoute(const HomePage());

      case '/Login':
        return _materialRoute(const LoginPage());

      case '/SignUp':
        return _materialRoute(const SignUpPage());

      case '/Process':
        return _materialRoute(const ProcessPage());

      default:
        return _materialRoute(const WelcomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
