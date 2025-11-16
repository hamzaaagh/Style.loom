import 'package:flutter/widgets.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_details_section.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_image_header.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: 
        Column(
          children: [
            ProductImageHeader(imageAssetPath: product.imageUrl),
            ProductDetailsSection(model: product),
          ],
        ),
      
    );
  }
}
