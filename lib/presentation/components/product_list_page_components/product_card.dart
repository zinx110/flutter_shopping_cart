import 'package:flutter/material.dart';
import 'package:flutter_shoping_cart/presentation/pages/product_details_page.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final Map<String, Object> product;

  // ProductCard({
  //   super.key,
  //   required this.product,
  //   required this.index,
  // });

  ProductCard({super.key, required this.product, required this.index})
      : title = product['title'].toString(),
        price = product['price'] as double,
        image = product['imageUrl'].toString();

  final String title;
  final double price;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailsPage(product: product),
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index % 2 == 0
              ? const Color.fromRGBO(216, 240, 253, 1)
              : const Color.fromRGBO(246, 247, 249, 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            Text(
              "\${$price}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            // Image(
            //   image: AssetImage(image),
            //   height: 175,
            // ),
            Center(
              child: Image.asset(
                image,
                height: 175,
              ),
            )
          ],
        ),
      ),
    );
  }
}
