part of 'genre_bloc.dart';

abstract class GenreState extends Equatable {
  final List<GenreEntity>? results;
  final DioException? exception;

  const GenreState({this.results, this.exception});

  @override
  List<Object> get props => [results!, exception!];
}

final class GenreLoading extends GenreState {
  const GenreLoading();
}

final class GenreSuccess extends GenreState {
  const GenreSuccess(List<GenreEntity>? results) : super(results: results);
}
