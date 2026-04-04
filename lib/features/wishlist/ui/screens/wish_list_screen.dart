import 'package:flutter/material.dart';

import '../../../common/ul/widgets/product_card.dart';
// import your localization extension if needed

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'), // or context.localization.wishlist
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return const ProductCard(); // 🔥 no need FittedBox usually
        },
      ),
    );
  }
}
