import 'package:flutter/material.dart';

class ProductDetailsContainer extends StatelessWidget {
  final Map<String, Object> product;
  final int selectedSize;
  final Function(int) setSelectedSize;
  final Function() onPressed;
  const ProductDetailsContainer({
    super.key,
    required this.product,
    required this.setSelectedSize,
    required this.selectedSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 247, 249, 1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "\$${product['price']}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(2),
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (product['sizes'] as List<int>).length,
              itemBuilder: (context, index) {
                final size = (product['sizes'] as List<int>)[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setSelectedSize(size);
                    },
                    child: Chip(
                        backgroundColor: selectedSize == size
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        label: Text(
                          size.toString(),
                        )),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  iconColor: Colors.black,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  fixedSize: const Size(400, 52)),
              onPressed: onPressed,
              icon: const Icon(Icons.shopping_cart),
              label: const Text(
                "Add to Cart",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
