import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class DetailAddToCartButton extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onTap;

  const DetailAddToCartButton({
    super.key,
    required this.totalPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [kAccentCoffee, Color(0xFF3D2010)],
          ),
          boxShadow: [
            BoxShadow(
              color: kAccentCoffee.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag_rounded,
              color: kAccentCream,
              size: 22,
            ),
            const SizedBox(width: 10),
            Text(
              'Add to Cart  •  \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                color: kAccentCream,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
