part of 'popular_movie_bloc.dart';

abstract class PopularMovieEvent {
  const PopularMovieEvent();
}

class GetPopularMovies extends PopularMovieEvent {
  const GetPopularMovies();
}
