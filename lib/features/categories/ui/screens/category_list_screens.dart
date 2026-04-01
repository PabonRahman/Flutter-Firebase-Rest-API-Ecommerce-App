import 'package:ecommerce/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../../../common/ul/widgets/category_item.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final List<Map<String, dynamic>> categories = [
    {"title": "Shoes", "icon": Icons.shopping_bag},
    {"title": "Clothes", "icon": Icons.checkroom},
    {"title": "Electronics", "icon": Icons.devices},
    {"title": "Watch", "icon": Icons.watch},
    {"title": "Beauty", "icon": Icons.brush},
    {"title": "Sports", "icon": Icons.sports_soccer},
    {"title": "Books", "icon": Icons.book},
    {"title": "Furniture", "icon": Icons.chair},
    {"title": "Laptop", "icon": Icons.laptop},
    {"title": "Mobile", "icon": Icons.phone_android},
    {"title": "Headphones", "icon": Icons.headphones},
    {"title": "More", "icon": Icons.more_horiz},
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __){
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Categories'),
          centerTitle: true,
        ),
      
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // change to 3 if looks tight
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8, // controls height
            ),
            itemBuilder: (context, index) {
              return CategoryItem(
                title: categories[index]['title'],
                icon: categories[index]['icon'],
              );
            },
          ),
        ),
      ),
    );
  }
}
