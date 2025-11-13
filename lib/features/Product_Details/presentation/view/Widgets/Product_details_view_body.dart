import 'package:flutter/material.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_details_section.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_image_header.dart';

class ProductDetailsViewBody extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String mainCategory;
  final String subCategory;
  final double price;

  const ProductDetailsViewBody({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.mainCategory,
    required this.subCategory,
    required this.price,
  });

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ===== صورة المنتج + أزرار الرجوع والمفضلة =====
        ProductImageHeader(
          imageAssetPath: widget.imageUrl,
          isFavorite: isFavorite,
          onBack: () => Navigator.of(context).maybePop(),
          onToggleFavorite: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
        ),

        const SizedBox(height: 20),

        // ===== تفاصيل المنتج =====
        ProductDetailsSection(
          productName: widget.productName,
          mainCategory: widget.mainCategory,
          subCategory: widget.subCategory,
          price: widget.price,
        ),
      ],
    );
  }
}
