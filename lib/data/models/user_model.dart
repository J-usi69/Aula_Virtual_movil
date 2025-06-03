//lib/data/models/user_model.dart


import 'package:aula_inteligente/core/constants/api_constants.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String? photoUrl;
  final String rol;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.rol,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    String? rawPhotoUrl = json['photo_url'];

    // Usar la función replaceLocalhost para ajustar la URL
    rawPhotoUrl = rawPhotoUrl != null ? replaceLocalhost(rawPhotoUrl) : null;

    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photoUrl: rawPhotoUrl,
      rol: json['rol']['nombre'],
    );
  }
}