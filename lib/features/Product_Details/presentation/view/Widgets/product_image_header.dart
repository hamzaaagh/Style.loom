import 'package:flutter/material.dart';

import 'rounded_icon_button.dart';

class ProductImageHeader extends StatelessWidget {
  final String imageAssetPath;
  final bool isFavorite;
  // final VoidCallback onBack;
  // final VoidCallback onToggleFavorite;

  const ProductImageHeader({
    super.key,
    required this.imageAssetPath,
    this.isFavorite = false,
    // required this.onBack,
    // required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.network(
              imageAssetPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),

        // Controls over the image
        Positioned(
          top: 10,
          left: 5,
          right: 5,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedIconButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    iconColor: Colors.white,
                    backgroundColor: Colors.black54,
                    onPressed: () =>
                        Navigator.of(context, rootNavigator: true).pop(),
                  ),
                  RoundedIconButton(
                    icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                    iconColor: isFavorite ? Colors.red : Colors.white,
                    backgroundColor: Colors.black54,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
