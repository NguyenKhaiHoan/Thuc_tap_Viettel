part of 'now_playing_movie_bloc.dart';

abstract class NowPlayingMovieState extends Equatable {
  final List<MovieEntity>? nowPlayingMovies;
  final DioException? exception;

  const NowPlayingMovieState({this.nowPlayingMovies, this.exception});

  @override
  List<Object> get props => [nowPlayingMovies!, exception!];
}

final class NowPlayingMovieLoading extends NowPlayingMovieState {
  const NowPlayingMovieLoading();
}

final class NowPlayingMovieSuccess extends NowPlayingMovieState {
  const NowPlayingMovieSuccess(
    List<MovieEntity> nowPlayingMovies,
  ) : super(
          nowPlayingMovies: nowPlayingMovies,
        );
}

final class NowPlayingMovieException extends NowPlayingMovieState {
  const NowPlayingMovieException(DioException exception)
      : super(exception: exception);
}
