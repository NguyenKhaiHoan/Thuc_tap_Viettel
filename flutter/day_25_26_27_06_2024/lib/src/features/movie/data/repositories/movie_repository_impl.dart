import 'dart:io';

import 'package:day_25_26_06_2024/src/features/movie/data/datasources/remote/movie_api_service.dart';
import 'package:day_25_26_06_2024/src/features/movie/domain/entities/movie.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/movie_repository.dart';
import '../models/movie.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApiService _movieApiService;

  MovieRepositoryImpl(this._movieApiService);

  @override
  Future<DataState<List<MovieModel>>> getNowPlayingMovies() async {
    try {
      final httpResponse = await _movieApiService.getNowPlayingMovies(
          apiKey: HAppAPI.movieAPIKey);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getPopularMovies() async {
    try {
      final httpResponse =
          await _movieApiService.getPopularMovies(apiKey: HAppAPI.movieAPIKey);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getTopRatedMovies() async {
    try {
      final httpResponse =
          await _movieApiService.getTopRatedMovies(apiKey: HAppAPI.movieAPIKey);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getUpcomingMovies() async {
    try {
      final httpResponse =
          await _movieApiService.getUpcomingMovies(apiKey: HAppAPI.movieAPIKey);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<DataState<MovieEntity>> getDetailMovie(int id) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<MovieEntity>>> getSearchMovies(String query) {
    throw UnimplementedError();
  }
}
