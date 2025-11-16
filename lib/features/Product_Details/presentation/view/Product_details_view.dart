import 'package:flutter/material.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/Product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProductDetailsViewBody(
          imageUrl: "assets/images/fashion-shopping-friends-choice-clothes-600nw-2472680449.png",
          productName: "Elegant Summer Dress",
          mainCategory: "Women Fashion",
          subCategory: "Dresses",
          price: 89.99,
        ),
      ),
    );
  }
}
