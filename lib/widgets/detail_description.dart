import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class DetailDescription extends StatelessWidget {
  final String? description;

  const DetailDescription({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section label
        const Text(
          'DESCRIPTION',
          style: TextStyle(
            color: kAccentGold,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 10),

        // Gold divider
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kAccentGold.withOpacity(0.5),
                kAccentCoffee.withOpacity(0.2),
                Colors.transparent,
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),

        // Body text
        Text(
          description ?? 'No description available.',
          style: TextStyle(
            color: kAccentCream.withOpacity(0.75),
            fontSize: 14,
            height: 1.7,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}
