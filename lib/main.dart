//lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aula_inteligente/features/auth/auth_controller.dart';
import 'package:aula_inteligente/routes/app_routes.dart';
import 'package:aula_inteligente/shared/theme/app_theme.dart';

void main() {
  runApp(const AulaApp());
}

class AulaApp extends StatelessWidget {
  const AulaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aula Inteligente',
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.login,
        routes: AppRoutes.routes,
      ),
    );
  }
}
