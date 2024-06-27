import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MovieBackdropEntity extends Equatable {
  String? filePath;

  MovieBackdropEntity({
    this.filePath,
  });

  @override
  List<Object?> get props {
    return [
      filePath,
    ];
  }
}
