import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetSearchMovieUseCase
    implements UseCase<DataState<List<MovieEntity>>, String> {
  final MovieRepository _movieRepository;

  GetSearchMovieUseCase(this._movieRepository);

  @override
  Future<DataState<List<MovieEntity>>> call({String? params}) {
    if (params == null) {
      return Future.error('');
    }
    return _movieRepository.getSearchMovies(params);
  }
}
