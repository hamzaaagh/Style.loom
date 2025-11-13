import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/Widgets/Custom_Bottom.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/Custom_Expansion_Tile.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomExpansionTile(
            title: "Descreption",
            longtitle: "${product.description}",
          ),
          CustomExpansionTile(
            title: "Reviews",
            longtitle:
                "Customer reviews and ratings will be displayed here. This section allows users to share their experiences with the product, providing insights into its quality, performance, and overall satisfaction. Reviews can help potential buyers make informed decisions based on the feedback from other customers.",
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottom(
                text: "Add to cart",
                onPressed: () {},
                icon: Icons.shopping_cart,
                color: Colors.black12,
              ),
              CustomBottom(
                text: "Buy Now",
                onPressed: () {},
                icon: Icons.shopping_bag,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Similar Products",
              style: TextStyle(color: Consts.brown60, fontSize: 30),
            ),
          ),
          // SimiliarProductsListView()
        ],
      ),
    );
  }
}
