part of 'now_playing_movie_bloc.dart';

abstract class NowPlayingMovieEvent {
  const NowPlayingMovieEvent();
}

class GetNowPlayingMovies extends NowPlayingMovieEvent {
  const GetNowPlayingMovies();
}
