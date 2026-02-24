import 'package:fetch_products/animation/animated_product_list.dart';
import 'package:fetch_products/animation/empty_state.dart';
import 'package:fetch_products/animation/loading_indicator.dart';
import 'package:fetch_products/viewModels/product_viewmodel.dart';
import 'package:fetch_products/widgets/home_header.dart';
import 'package:fetch_products/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1>
    with SingleTickerProviderStateMixin {
  AnimationController? _headerController;
  Animation<double>? _headerFade;
  Animation<Offset>? _headerSlide;

  @override
  void initState() {
    super.initState();

    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _headerFade = CurvedAnimation(
      parent: _headerController!,
      curve: Curves.easeOut,
    );

    _headerSlide = Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _headerController!,
            curve: Curves.easeOutCubic,
          ),
        );

    _headerController!.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<ProductViewmodel>(context, listen: false).fetchProducts();
      }
    });
  }

  @override
  void dispose() {
    _headerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductViewmodel>(context);

    if (_headerFade == null || _headerSlide == null) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _headerFade!,
              child: SlideTransition(
                position: _headerSlide!,
                child: const HomeHeader(),
              ),
            ),

            FadeTransition(
              opacity: _headerFade!,
              child: ProductSearchBar(
                onChanged: (value) => viewModel.searchProducts(value),
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: viewModel.isLoading
                  ? const LoadingIndicator()
                  : viewModel.products.isEmpty
                  ? const EmptyState()
                  : AnimatedProductList(products: viewModel.products),
            ),
          ],
        ),
      ),
    );
  }
}
