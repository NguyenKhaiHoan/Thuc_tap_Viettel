import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntity extends Equatable {
  String? firstName;
  String? lastName;
  String? email;
  String? urlToImage;
  UserEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.urlToImage,
  });

  @override
  List<Object?> get props => [firstName, lastName, email, urlToImage];
}
