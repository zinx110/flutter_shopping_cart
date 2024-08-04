import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_shoping_cart/presentation/components/cart_componets/ConfirmDeleteAlert.dart";

import "package:flutter_shoping_cart/providers/cart_provider.dart";
import "package:provider/provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context).cart;
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          final price = cartItem['price'] as double;
          final title = cartItem['title'] as String;
          final selectedSize = cartItem['selectedSize'] as int;
          final image = cartItem['imageUrl'] as String;
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 30,
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return ConfirmDeleteAlert(cartItem: cartItem);
                    });
              },
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text("Size: $selectedSize"),
          );
        },
      ),
    );
  }
}
