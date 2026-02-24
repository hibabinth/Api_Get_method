import 'package:flutter/material.dart';

class ProductDetailViewmodel extends ChangeNotifier {
  int _quantity = 1;

  int get quantity => _quantity;

  double totalPrice(double unitPrice) => unitPrice * _quantity;

  void increment() {
    _quantity++;
    notifyListeners();
  }

  void decrement() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }

  void addToCart(BuildContext context, double unitPrice) {
    final total = totalPrice(unitPrice).toStringAsFixed(2);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFFF2E0C8),
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              '$_quantity item(s) added  •  \$$total',
              style: const TextStyle(color: Color(0xFFF2E0C8)),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF6B4226),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
