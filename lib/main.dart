import 'package:flutter/material.dart';
import 'package:flutter_shoping_cart/core/app_theme.dart';
import 'package:flutter_shoping_cart/presentation/pages/home_page.dart';
import 'package:flutter_shoping_cart/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Shopping Cart",
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
