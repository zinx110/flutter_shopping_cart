import 'package:flutter/material.dart';
import 'package:flutter_shoping_cart/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ConfirmDeleteAlert extends StatelessWidget {
  const ConfirmDeleteAlert({
    super.key,
    required this.cartItem,
  });

  final Map<String, Object> cartItem;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Delete Product",
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: const Text("Are you sure you want to remove this item?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "No",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              // Provider.of<CartProvider>(context, listen: false)
              //     .removeProduct(cartItem);
              context.read<CartProvider>().removeProduct(cartItem);
              Navigator.of(context).pop();
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ))
      ],
    );
  }
}
