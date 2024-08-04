import "package:flutter/material.dart";
import "package:flutter_shoping_cart/presentation/components/product_details_page_components/product_details_container.dart";
import "package:flutter_shoping_cart/providers/cart_provider.dart";
import "package:provider/provider.dart";

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  void setSelectedSize(int size) {
    setState(() {
      selectedSize = size;
    });
  }

  void onPressed() {
    if (selectedSize == 0) {
      print("Please select");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please select a size!")));
      return;
    }
    Provider.of<CartProvider>(context, listen: false).addProduct({
      ...widget.product,
      'selectedSize': selectedSize as Object,
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Product added to cart")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                widget.product['imageUrl'] as String,
                height: 250,
              )),
          const Spacer(),
          ProductDetailsContainer(
            product: widget.product,
            setSelectedSize: setSelectedSize,
            selectedSize: selectedSize,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
