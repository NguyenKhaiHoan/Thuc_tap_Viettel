import '../../../../core/resources/data_state.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<DataState<List<MovieEntity>>> getNowPlayingMovies();
  Future<DataState<List<MovieEntity>>> getPopularMovies();
  Future<DataState<List<MovieEntity>>> getTopRatedMovies();
  Future<DataState<List<MovieEntity>>> getUpcomingMovies();

  Future<DataState<List<MovieEntity>>> getSearchMovies(String query);
  Future<DataState<MovieEntity>> getDetailMovie(int id);
}
