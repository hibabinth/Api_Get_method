import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class DetailQuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const DetailQuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Quantity',
          style: TextStyle(
            color: kAccentCream,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: kBgCard,
            border: Border.all(color: kAccentGold.withOpacity(0.2)),
          ),
          child: Row(
            children: [
              _QtyButton(icon: Icons.remove_rounded, onTap: onDecrement),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  '$quantity',
                  style: const TextStyle(
                    color: kAccentCream,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _QtyButton(icon: Icons.add_rounded, onTap: onIncrement),
            ],
          ),
        ),
      ],
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kAccentCoffee.withOpacity(0.3),
        ),
        child: Icon(icon, color: kAccentGold, size: 20),
      ),
    );
  }
}
