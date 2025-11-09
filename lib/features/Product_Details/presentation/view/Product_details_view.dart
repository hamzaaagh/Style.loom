import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/Product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProductDetailsViewBody()),
    );
  }
}