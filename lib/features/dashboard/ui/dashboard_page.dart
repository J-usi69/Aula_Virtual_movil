//lib/features/dashboard/ui/dashboard_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aula_inteligente/features/auth/auth_controller.dart';
import 'dashboard_appbar.dart';
import 'dashboard_body.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isReloading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleAutoReload);
    // Opcional: recarga inicial al entrar
    Future.microtask(() => _handleRefresh());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleAutoReload);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleAutoReload() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 20 &&
        !_isReloading) {
      setState(() => _isReloading = true);
      _reloadUserData().then((_) {
        setState(() => _isReloading = false);
      });
    }
  }

  Future<void> _handleRefresh() async {
    setState(() => _isReloading = true);
    await _reloadUserData();
    setState(() => _isReloading = false);
  }

  Future<void> _reloadUserData() async {
    final auth = Provider.of<AuthController>(context, listen: false);
    await auth
        .reloadUser(); // este método debe actualizar y hacer notifyListeners()
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthController>(context).user;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FF),
      appBar: buildDashboardAppBar(user),
      body: DashboardBody(
        scrollController: _scrollController,
        isReloading: _isReloading,
        onRefresh: _handleRefresh,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              color: Colors.grey,
              onPressed: () {},
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              color: Colors.grey,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_outline),
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
