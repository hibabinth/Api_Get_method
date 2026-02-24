import 'package:fetch_products/widgets/detail_add_to_cart_button.dart';
import 'package:fetch_products/widgets/detail_category_chip.dart';
import 'package:fetch_products/widgets/detail_description.dart';
import 'package:fetch_products/widgets/detail_image_section.dart';
import 'package:fetch_products/widgets/detail_price_row.dart';
import 'package:fetch_products/widgets/detail_quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../viewModels/product_detail_viewmodel.dart';

class ProductDetailPage extends StatelessWidget {
  final dynamic product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailViewmodel(),
      child: _DetailScaffold(product: product),
    );
  }
}

// ── Inner scaffold ─────────────────────────────────────────────────────────────
class _DetailScaffold extends StatefulWidget {
  final dynamic product;
  const _DetailScaffold({required this.product});

  @override
  State<_DetailScaffold> createState() => _DetailScaffoldState();
}

class _DetailScaffoldState extends State<_DetailScaffold>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnim;
  Animation<Offset>? _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    _fadeAnim = CurvedAnimation(parent: _controller!, curve: Curves.easeOut);

    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _controller!, curve: Curves.easeOutCubic),
        );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductDetailViewmodel>(context);
    final product = widget.product;

    return Scaffold(
      backgroundColor: kBgDeep,
      body: Column(
        children: [
          // ── Hero Image + Back button ───────────────────────────────────────
          DetailImageSection(product: product),

          // ── Animated scrollable content ────────────────────────────────────
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnim!,
              child: SlideTransition(
                position: _slideAnim!,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailCategoryChip(label: product.category),
                      const SizedBox(height: 12),

                      Text(
                        product.title,
                        style: const TextStyle(
                          color: kAccentCream,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.35,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 20),

                      DetailPriceRow(product: product),
                      const SizedBox(height: 28),

                      DetailDescription(description: product.description),
                      const SizedBox(height: 28),

                      DetailQuantitySelector(
                        quantity: viewModel.quantity,
                        onDecrement: viewModel.decrement,
                        onIncrement: viewModel.increment,
                      ),
                      const SizedBox(height: 28),

                      DetailAddToCartButton(
                        totalPrice: viewModel.totalPrice(product.price),
                        onTap: () =>
                            viewModel.addToCart(context, product.price),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
