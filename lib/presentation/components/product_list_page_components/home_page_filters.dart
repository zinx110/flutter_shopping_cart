import 'package:flutter/material.dart';

class HomePageFilters extends StatelessWidget {
  final List<String> filters;
  final List<String> selectedFilters;
  final Function(String) changeFilters;
  const HomePageFilters({
    super.key,
    required this.filters,
    required this.selectedFilters,
    required this.changeFilters,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                changeFilters(filter);
              },
              child: Chip(
                  label: Text(filter),
                  labelStyle: const TextStyle(fontSize: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: selectedFilters.contains(filter)
                      ? Theme.of(context).colorScheme.primary
                      : const Color.fromRGBO(245, 247, 249, 1),
                  side: const BorderSide(
                      color: Color.fromRGBO(245, 247, 249, 1),
                      style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          );
        },
      ),
    );
  }
}
