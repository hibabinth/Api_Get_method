import 'package:fetch_products/views/home_page1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewModels/product_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ProductViewmodel(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage1(), debugShowCheckedModeBanner: false);
  }
}
