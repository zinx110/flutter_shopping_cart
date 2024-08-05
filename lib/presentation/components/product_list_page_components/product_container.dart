import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shoping_cart/global_variables.dart';
import 'package:flutter_shoping_cart/presentation/components/product_list_page_components/product_card.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final size = MediaQuery.sizeOf(context);

    // if (size.width > 650) {
    //   return Expanded(
    //     child: GridView.builder(
    //       itemCount: products.length,
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //           childAspectRatio: 2, crossAxisCount: 2),
    //       itemBuilder: (context, index) {
    //         final product = products[index];

    //         return ProductCard(
    //           product: product,
    //           index: index,
    //         );
    //       },
    //     ),
    //   );
    // }

    // return Expanded(
    //   child: ListView.builder(
    //     itemCount: products.length,
    //     itemBuilder: (context, index) {
    //       final product = products[index];

    //       return ProductCard(
    //         product: product,
    //         index: index,
    //       );
    //     },
    //   ),
    // );

    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1080) {
            return GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.75,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCard(
                  product: product,
                  index: index,
                );
              },
            );
          }
          return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCard(
                  product: product,
                  index: index,
                );
              });
        },
      ),
    );
  }
}
