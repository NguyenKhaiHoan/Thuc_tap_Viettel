part of 'popular_movie_bloc.dart';

abstract class PopularMovieState extends Equatable {
  final List<MovieEntity>? popularMovies;
  final DioException? exception;

  const PopularMovieState({this.popularMovies, this.exception});

  @override
  List<Object> get props => [popularMovies!, exception!];
}

final class PopularMovieLoading extends PopularMovieState {
  const PopularMovieLoading();
}

final class PopularMovieSuccess extends PopularMovieState {
  const PopularMovieSuccess(
    List<MovieEntity> popularMovies,
  ) : super(
          popularMovies: popularMovies,
        );
}

final class PopularMovieException extends PopularMovieState {
  const PopularMovieException(DioException exception)
      : super(exception: exception);
}
