//lib/features/auth/auth_controller.dart

import 'package:flutter/material.dart';
import 'package:aula_inteligente/data/repositories/auth_service.dart';
import 'package:aula_inteligente/data/models/user_model.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  UserModel? user;
  String? error;

  // Login con email y password
  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    final (success, resultUser, err) = await _authService.login(
      email,
      password,
    );

    isLoading = false;

    if (success) {
      user = resultUser;
      error = null;
    } else {
      user = null;
      error = err;
    }

    notifyListeners();
    return success;
  }

  // Cargar o recargar datos del usuario logueado
  Future<void> reloadUser() async {
    try {
      final result =
          await _authService
              .getCurrentUser(); // <- Este debe retornar UserModel
      user = result;
      notifyListeners();
    } catch (e) {
      debugPrint('Error al recargar usuario: $e');
    }
  }

  // Cerrar sesión si deseas agregarlo después
  Future<void> logout() async {
    await _authService.logout();
    user = null;
    notifyListeners();
  }
}
