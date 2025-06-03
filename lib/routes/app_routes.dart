//lib/routes/app_routes.dart

import 'package:flutter/material.dart';
import 'package:aula_inteligente/features/auth/ui/login_page.dart';
import 'package:aula_inteligente/features/dashboard/ui/dashboard_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginPage(),
    dashboard: (context) => const DashboardPage(),
  };
}
