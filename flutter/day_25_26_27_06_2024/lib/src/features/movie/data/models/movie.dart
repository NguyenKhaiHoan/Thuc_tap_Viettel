import '../../domain/entities/movie.dart';

// ignore: must_be_immutable
class MovieModel extends MovieEntity {
  MovieModel({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
    super.backdrops,
  });

  factory MovieModel.fromJson(Map<String, dynamic> data) => MovieModel(
        adult: data['adult'] as bool?,
        backdropPath: data['backdrop_path'] as String?,
        genreIds: data['genre_ids'] == null
            ? []
            : (data['genre_ids'] as List<dynamic>)
                .map((e) => int.parse(e.toString()))
                .toList(),
        id: data['id'] as int?,
        originalLanguage: data['original_language'] as String?,
        originalTitle: data['original_title'] as String?,
        overview: data['overview'] as String?,
        popularity: (data['popularity'] as num?)?.toDouble(),
        posterPath: data['poster_path'] as String?,
        releaseDate: data['release_date'] as String?,
        title: data['title'] as String?,
        video: data['video'] as bool?,
        voteAverage: (data['vote_average'] as num?)?.toDouble(),
        voteCount: data['vote_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
