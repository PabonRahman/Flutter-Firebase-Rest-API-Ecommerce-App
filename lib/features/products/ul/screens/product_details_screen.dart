import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/localization_extension.dart';

import '../widgets/increment_decrement_counter_widget.dart';
import '../widgets/product_image_carousel_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localization.productdetails)),

      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ProductImageCarouselSlider(),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nike new edition',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IncrementDecrementCounterWidget(
                            onChange: (int value) {
                              print(value);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price'),
                    Text('\$1000', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),),
                  ],
                ),
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Add To Cart"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
