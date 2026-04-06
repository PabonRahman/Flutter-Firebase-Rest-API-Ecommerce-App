import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/localization_extension.dart';
import '../widgets/color_picker.dart';
import '../widgets/size_picker.dart';
import '../widgets/increment_decrement_counter_widget.dart';
import '../widgets/product_image_carousel_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedColor = '';
  String selectedSize = '';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.productdetails),
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Product Image
                  ProductImageCarouselSlider(),

                  /// Content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title + Counter
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nike new edition',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      const Text('4.2'),

                                      const SizedBox(width: 8),

                                      TextButton(
                                        onPressed: () {},
                                        child: const Text('Reviews'),
                                      ),

                                      Card(
                                        color: AppColors.themeColor,
                                        shape:
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(4),
                                        ),
                                        child: const Padding(
                                          padding:
                                          EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            /// Quantity
                            IncrementDecrementCounterWidget(
                              onChange: (value) {
                                quantity = value;
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        /// Color Picker
                        ColorPicker(
                          colors: ['Red', 'White', 'Black', 'Pink'],
                          onChange: (color) {
                            selectedColor = color;
                          },
                        ),

                        const SizedBox(height: 16),

                        /// Size Picker
                        SizePicker(
                          sizes: ['S', 'M', 'L', 'XL'],
                          onChange: (size) {
                            selectedSize = size;
                          },
                        ),

                        const SizedBox(height: 16),

                        /// Description
                        const Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum continues as a placeholder for long product descriptions, helping you test scrolling behavior and UI alignment across different screen sizes.

This section simulates a real eCommerce product description where details about material, design, usability, and features are explained thoroughly to help users make informed decisions.''',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Bottom Section
          _buildPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: const [
              Text('Price'),
              SizedBox(height: 4),
              Text(
                '\$1000',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),

          SizedBox(
            width: 140,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeColor,
                padding:
                const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                print("Color: $selectedColor");
                print("Size: $selectedSize");
                print("Qty: $quantity");
              },
              child: const Text("Add To Cart"),
            ),
          ),
        ],
      ),
    );
  }
}