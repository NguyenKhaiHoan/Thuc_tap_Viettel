import 'package:day_25_26_06_2024/src/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:day_25_26_06_2024/src/features/movie/presentation/bloc/genre/genre_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'src/features/movie/data/datasources/remote/movie_api_service.dart';
import 'src/features/movie/data/repositories/movie_repository_impl.dart';
import 'src/features/movie/domain/repositories/movie_repository.dart';
import 'src/features/movie/domain/usecases/get_now_playing_movie.dart';
import 'src/features/movie/domain/usecases/get_popular_movie.dart';
import 'src/features/movie/presentation/bloc/movie/remote/now_playing/now_playing_movie_bloc.dart';
import 'src/features/movie/presentation/bloc/movie/remote/popular/popular_movie_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<AuthBloc>(AuthBloc());

  sl.registerSingleton<MovieApiService>(MovieApiService(sl()));

  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl(sl()));

  sl.registerSingleton<GetNowPlayingMovieUseCase>(
      GetNowPlayingMovieUseCase(sl()));

  sl.registerSingleton<GetPopularMovieUseCase>(GetPopularMovieUseCase(sl()));

  sl.registerFactory<GenreBloc>(() => GenreBloc());

  sl.registerFactory<NowPlayingMovieBloc>(() => NowPlayingMovieBloc(sl()));

  sl.registerFactory<PopularMovieBloc>(() => PopularMovieBloc(sl()));
}
