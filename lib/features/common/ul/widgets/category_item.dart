import 'package:ecommerce/features/products/ul/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryItem({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: title,
        );
      },
      child: SizedBox(
        width: 80, // ✅ fixed width for consistency
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.zero,
              color: AppColors.themeColor.withOpacity(0.15),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  icon,
                  size: 32,
                  color: AppColors.themeColor,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}