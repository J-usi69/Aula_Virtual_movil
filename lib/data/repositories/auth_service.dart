//lib/data/repositories/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aula_inteligente/core/constants/api_constants.dart';
import 'package:aula_inteligente/data/models/user_model.dart';
import 'package:aula_inteligente/core/storage/secure_storage.dart';

class AuthService {
  // Login
  Future<(bool, UserModel?, String?)> login(
    String email,
    String password,
  ) async {
    try {
      final url = Uri.parse('$baseUrl/auth/login');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final token = json['token'];
        final user = UserModel.fromJson(json['user']);

        // Guardar token
        await SecureStorage.saveToken(token);

        return (true, user, null);
      } else {
        final json = jsonDecode(response.body);
        final String error = json['error'] ?? 'Error desconocido';
        return (false, null, error);
      }
    } catch (e) {
      final String error = 'Error de conexión: $e';
      return (false, null, error);
    }
  }

  // Obtener usuario actual con token guardado
  Future<UserModel> getCurrentUser() async {
    final url = Uri.parse('$baseUrl/auth/me');
    final token = await SecureStorage.readToken();

    if (token == null) {
      throw Exception('Token no encontrado');
    }

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return UserModel.fromJson(json);
    } else {
      throw Exception('No se pudo obtener el usuario actual');
    }
  }

  // Logout (opcional)
  Future<void> logout() async {
    final url = Uri.parse('$baseUrl/auth/logout');
    final token = await SecureStorage.readToken();

    await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    await SecureStorage.deleteToken();
  }
}
