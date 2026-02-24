import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.inbox_rounded,
            size: 64,
            color: kAccentCoffee.withOpacity(0.5),
          ),
          const SizedBox(height: 12),
          const Text(
            'No products found',
            style: TextStyle(color: kSubtext, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
