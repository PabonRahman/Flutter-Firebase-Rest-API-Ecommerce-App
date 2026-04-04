import 'package:flutter/material.dart';
import 'package:ecommerce/app/app_colors.dart';

class IncrementDecrementCounterWidget extends StatefulWidget {
  const IncrementDecrementCounterWidget({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<IncrementDecrementCounterWidget> createState() =>
      _IncrementDecrementCounterWidgetState();
}

class _IncrementDecrementCounterWidgetState
    extends State<IncrementDecrementCounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// ➖ Decrement Button
        GestureDetector(
          onTap: () {
            if (count <= 1) return;
            count--;
            widget.onChange(count);
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.remove, color: Colors.white),
          ),
        ),

        const SizedBox(width: 12),

        /// 🔢 Count Text
        Text(
          '$count',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(width: 12),

        /// ➕ Increment Button
        GestureDetector(
          onTap: () {
            if (count >= 20) return;
            count++;
            widget.onChange(count);
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}