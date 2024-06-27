import 'package:day_25_26_06_2024/src/features/auth/domain/entities/user.dart';

class UserModel extends UserEntity {
  UserModel({super.email, super.firstName, super.lastName, super.urlToImage});

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'urlToImage': urlToImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      urlToImage: map['urlToImage'],
    );
  }
}
