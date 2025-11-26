import 'package:flutter/material.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/Widgets/Custom_Bottom.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/Custom_Expansion_Tile.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/Similiar_Products_List_view.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_quantity_counter.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_rating_stars.dart';

class ProductDetailsSection extends StatelessWidget {
  final ProductModel model;

  const ProductDetailsSection({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<FetchSimiliarItemCubit>(
    //   context,
    // ).fetchSimiliarproductsitem(product: model);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name!,
            style: const TextStyle(
              fontSize: 25,
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
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                model.subCategory!.name!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            "\$ ${model.price!.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Consts.brown65,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ProductRatingStars(rating: 3.5),
              const SizedBox(width: 5),
              const Text(
                "(10)",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 15),
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
          CustomExpansionTile(title: "Reviews", longtitle: "This is reviews "),
          const SizedBox(height: 30),
          // Responsive buttons: side-by-side on wide screens, stacked on narrow
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 360;
              if (isNarrow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomBottom(
                      color: Consts.black10,
                      text: "Add to Cart",
                      onPressed: () {},
                      icon: Icons.card_giftcard,
                    ),
                    const SizedBox(height: 10),
                    CustomBottom(
                      text: "Buy Now",
                      onPressed: () {},
                      icon: Icons.shopping_bag,
                    ),
                  ],
                );
              }

              return Row(
                children: [
                  // Give Add to Cart a slightly larger share of the width
                  Expanded(
                    flex: 1,
                    child: CustomBottom(
                      color: Consts.black10,
                      text: "Add to Cart",
                      onPressed: () {},
                      icon: Icons.card_giftcard,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    flex: 1,
                    child: CustomBottom(
                      text: "Buy Now",
                      onPressed: () {},
                      icon: Icons.shopping_bag,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 25),
          const Text(
            "Similiar Products",
            style:TextStyle(
              color: Consts.brown70,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              height: 150,
              child: SimiliarProductsListView(product: model),
            ),
          ),
        ],
      ),
    );
  }
}
