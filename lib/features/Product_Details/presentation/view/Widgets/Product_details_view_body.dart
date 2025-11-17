import 'package:flutter/widgets.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_details_section.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_image_header.dart';

class ProductDetailsViewBody extends StatefulWidget {
  ProductDetailsViewBody({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  late String fullImageUrl;
  @override
  void initState() {
    super.initState();
    fullImageUrl = "http://10.3.73.102:3000${widget.product.imageUrl}";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImageHeader(imageAssetPath: fullImageUrl),
          ProductDetailsSection(model: widget.product),
        ],
      ),
    );
  }
}
