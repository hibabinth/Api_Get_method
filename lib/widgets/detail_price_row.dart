import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class DetailPriceRow extends StatelessWidget {
  final dynamic product;

  const DetailPriceRow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _PriceBadge(price: product.price),
        if (product.rating != null)
          _RatingBadge(rate: product.rating.rate, count: product.rating.count),
      ],
    );
  }
}

class _PriceBadge extends StatelessWidget {
  final double price;
  const _PriceBadge({required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [kAccentCoffee, Color(0xFF3D2010)],
        ),
        boxShadow: [
          BoxShadow(
            color: kAccentCoffee.withOpacity(0.45),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        '\$$price',
        style: const TextStyle(
          color: kAccentCream,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final double rate;
  final int count;
  const _RatingBadge({required this.rate, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: kBgCard,
        border: Border.all(color: kAccentGold.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_rounded, color: kAccentGold, size: 20),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$rate',
                style: const TextStyle(
                  color: kAccentCream,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$count reviews',
                style: const TextStyle(color: kSubtext, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
