import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api.dart';
import '../../models/movie.dart';
import '../../models/movie_backdrop.dart';

part 'movie_api_service.g.dart';

@RestApi(baseUrl: HAppAPI.movieBaseUrl)
abstract class MovieApiService {
  factory MovieApiService(Dio dio) = _MovieApiService;

  @GET('/movie/now_playing')
  Future<HttpResponse<List<MovieModel>>> getNowPlayingMovies(
      {@Query('api_key') required String apiKey});
  @GET('/movie/popular')
  Future<HttpResponse<List<MovieModel>>> getPopularMovies(
      {@Query('api_key') required String apiKey});
  @GET('/movie/top_rated')
  Future<HttpResponse<List<MovieModel>>> getTopRatedMovies(
      {@Query('api_key') required String apiKey});
  @GET('/movie/upcoming')
  Future<HttpResponse<List<MovieModel>>> getUpcomingMovies(
      {@Query('api_key') required String apiKey});
  @GET('/search/movie')
  Future<HttpResponse<List<MovieModel>>> searchMovies(
      {@Query('api_key') required String apiKey,
      @Query('query') required String query});
  @GET('movie/{id}')
  Future<HttpResponse<List<MovieModel>>> getDetailMovies(
      {@Path('id') required String id,
      @Query('api_key') required String apiKey});
  @GET('movie/{id}/images')
  Future<HttpResponse<List<MovieBackdropModel>>> getMovieBackdrops(
      {@Path('id') required String id,
      @Query('api_key') required String apiKey});
}
