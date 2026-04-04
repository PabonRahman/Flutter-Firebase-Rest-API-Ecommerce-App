import 'package:ecommerce/features/common/controllers/main_bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/home/ui/widgets/app_bar_action_button.dart';
import 'package:ecommerce/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:ecommerce/features/home/ui/widgets/section_header.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../../../../core/extensions/localization_extension.dart';
import '../../../common/ul/widgets/category_item.dart';
import '../../../common/ul/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Map<String, dynamic>> categories = [
    {'title': 'Computers', 'icon': Icons.computer},
    {'title': 'Phones', 'icon': Icons.phone_android},
    {'title': 'TVs', 'icon': Icons.tv},
    {'title': 'Cameras', 'icon': Icons.camera_alt},
    {'title': 'Headphones', 'icon': Icons.headphones},
    {'title': 'Watches', 'icon': Icons.watch},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔍 Search
            _buildSearchTextField(),
            const SizedBox(height: 16),

            /// 🎯 Slider
            const HomeCarouselSlider(),
            const SizedBox(height: 20),

            /// 🧩 Categories
            SectionHeader(
              title: context.localization.categories,
              onTapSeeAll: () {
                Get.find<MainBottomNavBarController>().moveToCategory();
              },
            ),
            const SizedBox(height: 12),
            _buildCategorySection(),

            const SizedBox(height: 24),

            /// ⭐ Product Sections (Reusable)
            _buildProductBlock(context.localization.popular),
            _buildProductBlock(context.localization.special),
            _buildProductBlock(context.localization.snew),

          ],
        ),
      ),
    );
  }

  /// 🔁 Reusable Product Block
  Widget _buildProductBlock(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: title,
          onTapSeeAll: () {},
        ),
        const SizedBox(height: 12),
        _buildProductSection(),
        const SizedBox(height: 24),
      ],
    );
  }

  /// 🔄 Horizontal Product List
  Widget _buildProductSection() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return const ProductCard();
        },
      ),
    );
  }

  /// 🧩 Category List
  Widget _buildCategorySection() {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            title: category['title'],
            icon: category['icon'],
          );
        },
      ),
    );
  }

  /// 🔍 Search Field
  Widget _buildSearchTextField() {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search products...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// 🔝 App Bar
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: SvgPicture.asset(
        AssetsPath.logoNavSvg,
        height: 28,
      ),
      actions: [
        AppBarActionButton(icon: Icons.person_outline, onTap: () {}),
        AppBarActionButton(icon: Icons.call, onTap: () {}),
        AppBarActionButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}