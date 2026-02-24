import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ProductSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const ProductSearchBar({super.key, required this.onChanged});

  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kBgCard,
          boxShadow: [
            BoxShadow(
              color: kAccentGold.withOpacity(0.12),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: kAccentGold.withOpacity(0.2), width: 1),
        ),
        child: TextField(
          controller: _controller,
          style: const TextStyle(color: kAccentCream, fontSize: 15),
          onChanged: (value) {
            setState(() {});
            widget.onChanged(value);
          },
          decoration: InputDecoration(
            hintText: 'Search by name or category...',
            hintStyle: TextStyle(color: kSubtext, fontSize: 14),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: kAccentGold.withOpacity(0.8),
              size: 22,
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.close_rounded, color: kSubtext, size: 18),
                    onPressed: () {
                      _controller.clear();
                      widget.onChanged('');
                      setState(() {});
                    },
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ),
    );
  }
}
