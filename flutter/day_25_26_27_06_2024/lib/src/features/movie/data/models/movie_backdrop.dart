import '../../domain/entities/movie_backdrop.dart';

// ignore: must_be_immutable
class MovieBackdropModel extends MovieBackdropEntity {
  MovieBackdropModel({super.filePath});

  factory MovieBackdropModel.fromJson(Map<String, dynamic> data) {
    return MovieBackdropModel(
      filePath: data['file_path'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'file_path': filePath,
      };
}
