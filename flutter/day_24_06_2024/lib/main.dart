import 'package:day_24_06_2024/config/routes/routes.dart';
import 'package:day_24_06_2024/config/theme/app_theme.dart';
import 'package:day_24_06_2024/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:day_24_06_2024/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:day_24_06_2024/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'News',
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: DailyNews(),
      ),
    );
  }
}
