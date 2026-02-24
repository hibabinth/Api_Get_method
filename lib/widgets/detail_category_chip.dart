import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class DetailCategoryChip extends StatelessWidget {
  final String label;

  const DetailCategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kAccentCoffee.withOpacity(0.25),
        border: Border.all(color: kAccentCoffee.withOpacity(0.5), width: 0.8),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: kAccentGold.withOpacity(0.9),
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
