//lib/features/dashboard/ui/dashboard_body.dart


import 'package:flutter/material.dart';
import 'dashboard_chip.dart';

class DashboardBody extends StatelessWidget {
  final ScrollController scrollController;
  final bool isReloading;
  final Future<void> Function() onRefresh;

  const DashboardBody({
    super.key,
    required this.scrollController,
    required this.isReloading,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isReloading) ...[
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
            _buildSearchBar(),
            const SizedBox(height: 20),
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  DashboardChip(label: 'Top'),
                  DashboardChip(label: 'Diseño'),
                  DashboardChip(label: 'Programación'),
                  DashboardChip(label: 'Idiomas'),
                  DashboardChip(label: 'Marketing'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Contenido próximamente...',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: 'Buscar contenido',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
