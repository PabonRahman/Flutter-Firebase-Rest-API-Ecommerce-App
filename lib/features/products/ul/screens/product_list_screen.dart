import 'package:flutter/material.dart';

import '../../../common/ul/widgets/product_card.dart';


class ProductListScreen extends StatefulWidget {
  static const String name = '/product-list';

  final String category;

  const ProductListScreen({super.key, required this.category});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 items per row
          mainAxisSpacing: 8,
          crossAxisSpacing: 0,
          childAspectRatio: 0.75, // optional (controls height)
        ),
        itemBuilder: (context, index) {
          return const FittedBox(
            child: ProductCard(),
          );
        },
      ),
    );
  }
}