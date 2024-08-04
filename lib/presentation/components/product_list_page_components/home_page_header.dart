import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border(
            {Color color = const Color.fromRGBO(225, 225, 225, 1)}) =>
        OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(50),
          ),
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Shoes\nCollection',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: border(),
                focusedBorder:
                    border(color: const Color.fromRGBO(200, 200, 300, 1)),
                enabledBorder: border()),
          ),
        )
      ],
    );
  }
}
