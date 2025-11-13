import 'package:flutter/material.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_quantity_counter.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_rating_stars.dart';

class ProductDetailsSection extends StatelessWidget {
  final String productName;
  final String mainCategory;
  final String subCategory;
  final double price;

  const ProductDetailsSection({
    super.key,
    required this.productName,
    required this.mainCategory,
    required this.subCategory,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Consts.brown65,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Text(
                mainCategory,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Consts.brown70,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              Text(
                subCategory,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Consts.brown70,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            "\$${price.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Consts.brown60,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ProductRatingStars(rating: 3.5),
              const SizedBox(width: 5),
              const Text(
                "(10)",
                style: TextStyle(fontSize: 20, color: Consts.gray95),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "Select quantity:",
            style: TextStyle(
              fontSize: 20,
              color: Consts.brown60,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          ProductQuantityCounter(
            initialQuantity: 1,
            onQuantityChanged: (value) {
              // Handle quantity change if needed
            },
          ),
        ],
      ),
    );
  }
}


