import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/home/ui/widgets/app_bar_action_button.dart';
import 'package:ecommerce/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:ecommerce/features/home/ui/widgets/section_header.dart';
import '../../../../core/extensions/localization_extension.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔍 Search Field
              _buildSearchTextField(),

              const SizedBox(height: 16),

              /// 🎯 Carousel Slider
              const HomeCarouselSlider(),

              const SizedBox(height: 16),

              /// 🧩 Section Header
              SectionHeader(
                title: context.localization.categories,
                onTapSeeAll: () {},
              ),

              const SizedBox(height: 12),

              /// 🧱 Horizontal Scrollable Categories
              SizedBox(height: 120, child: _buildCategorySection()),

              const SizedBox(height: 20),

              /// 🛍 Placeholder for future content (e.g., product grid)
              const Text(
                "More Content Coming...",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          SizedBox(width: 4),
          CategoryItem(title: 'Computers', icon: Icons.computer),
          SizedBox(width: 12),
          CategoryItem(title: 'Phones', icon: Icons.phone_android),
          SizedBox(width: 12),
          CategoryItem(title: 'TVs', icon: Icons.tv),
          SizedBox(width: 12),
          CategoryItem(title: 'Cameras', icon: Icons.camera_alt),
          SizedBox(width: 12),
          CategoryItem(title: 'Headphones', icon: Icons.headphones),
          SizedBox(width: 12),
          CategoryItem(title: 'Watches', icon: Icons.watch),
          SizedBox(width: 12),
        ],
      ),
    );
  }

  /// 🔍 Search Field
  Widget _buildSearchTextField() {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
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
      title: SvgPicture.asset(AssetsPath.logoNavSvg, height: 30),
      actions: [
        const SizedBox(width: 8),
        AppBarActionButton(icon: Icons.person_outline, onTap: () {}),
        const SizedBox(width: 8),
        AppBarActionButton(icon: Icons.call, onTap: () {}),
        const SizedBox(width: 8),
        AppBarActionButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

/// ✅ Category Item Widget
