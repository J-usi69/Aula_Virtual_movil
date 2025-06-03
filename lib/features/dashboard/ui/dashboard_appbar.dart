//lib/features/dashboard/ui/dashboard_appbar.dart


import 'package:flutter/material.dart';
import 'package:aula_inteligente/data/models/user_model.dart';
import 'dashboard_avatar.dart';

PreferredSizeWidget buildDashboardAppBar(UserModel? user) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    automaticallyImplyLeading: false,
    toolbarHeight: 100,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              DashboardAvatar(
                photoUrl: user?.photoUrl,
                name: user?.name ?? "Usuario",
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola ${user?.name ?? "Usuario"}!',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '(${user?.rol ?? "Sin rol"})',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
