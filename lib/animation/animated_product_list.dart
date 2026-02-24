import 'package:flutter/material.dart';
import 'package:fetch_products/widgets/product_card.dart';

class AnimatedProductList extends StatefulWidget {
  final List<dynamic> products;
  final void Function(dynamic product) onProductTapped;

  const AnimatedProductList({
    super.key,
    required this.products,
    required this.onProductTapped,
  });

  @override
  State<AnimatedProductList> createState() => _AnimatedProductListState();
}

class _AnimatedProductListState extends State<AnimatedProductList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = widget.products;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final start = (index / products.length) * 0.6;
        final end = (start + 0.4).clamp(0.0, 1.0);

        final fadeAnim = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(start, end, curve: Curves.easeOutCubic),
          ),
        );

        final slideAnim =
            Tween<Offset>(
              begin: const Offset(0.15, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(start, end, curve: Curves.easeOutCubic),
              ),
            );

        return FadeTransition(
          opacity: fadeAnim,
          child: SlideTransition(
            position: slideAnim,
            child: ProductCard(
              product: products[index],
              onTap: () => widget.onProductTapped(products[index]),
            ),
          ),
        );
      },
    );
  }
}
