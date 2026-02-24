import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(
              color: kAccentGold,
              backgroundColor: kAccentCoffee.withOpacity(0.2),
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading products...',
            style: TextStyle(color: kSubtext, fontSize: 14, letterSpacing: 0.4),
          ),
        ],
      ),
    );
  }
}
