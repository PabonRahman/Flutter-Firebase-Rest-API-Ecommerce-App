import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({super.key});

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {
  int _selectedSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _selectedSlider = index;
              });
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,

                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Image $i',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),

        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                height: 10,
                width: 10,
                margin: const EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                  color: _selectedSlider == index
                      ? AppColors.themeColor
                      : Colors.white,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
