import 'package:flutter/material.dart';
import 'package:flutter_shoping_cart/presentation/components/product_list_page_components/home_page_filters.dart';
import 'package:flutter_shoping_cart/presentation/components/product_list_page_components/home_page_header.dart';
import 'package:flutter_shoping_cart/presentation/components/product_list_page_components/product_container.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata', 'Apex'];
  late List<String> selectedFilters = [];
  @override
  void initState() {
    super.initState();
    selectedFilters = [filters[0]];
  }

  void changeFilters(String filter) {
    setState(() {
      if (selectedFilters.contains(filter)) {
        selectedFilters.remove(filter);
      } else {
        selectedFilters.add(filter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const HomePageHeader(),
          HomePageFilters(
            filters: filters,
            selectedFilters: selectedFilters,
            changeFilters: changeFilters,
          ),
          const ProductContainer(),
        ],
      ),
    );
  }
}
