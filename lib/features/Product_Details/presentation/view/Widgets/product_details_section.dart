import 'package:flutter/material.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/Widgets/Custom_Bottom.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/Custom_Expansion_Tile.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_quantity_counter.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_rating_stars.dart';

class ProductDetailsSection extends StatelessWidget {
  final ProductModel model;

  const ProductDetailsSection({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name!,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Consts.brown65,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Text(
                model.subCategory!.main!.name!,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Consts.brown70,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                model.subCategory!.name!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Consts.brown70,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            "\$${model.price!.toStringAsFixed(2)}",
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
          const SizedBox(height: 20),
          CustomExpansionTile(
            title: "Discreption",
            longtitle: model.description!,
          ),
          CustomExpansionTile(title: "Reviews", longtitle: "hhhh"),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottom(
                color: Consts.black10,
                text: "Add to Cart",
                onPressed: () {},
                icon: Icons.card_giftcard,
              ),

              CustomBottom(
                text: "Buy Now",
                onPressed: () {},
                icon: Icons.shopping_bag,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
