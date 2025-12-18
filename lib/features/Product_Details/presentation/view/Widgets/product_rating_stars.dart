import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductRatingStars extends StatelessWidget {
  final double rating;     // التقييم الحالي
  final double size;       // حجم النجوم
  final int starCount;     // عدد النجوم (عادة 5)
  final bool isInteractive; // هل المستخدم يستطيع التقييم؟

  const ProductRatingStars({
    super.key,
    required this.rating,
    this.size = 24,
    this.starCount = 5,
    this.isInteractive = false,
  });

  @override
  Widget build(BuildContext context) {
    return isInteractive
        ? RatingBar.builder(
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: starCount,
            itemSize: size,
            itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (newRating) {
              // يمكنك هنا حفظ التقييم مثلاً في Firebase أو في state
              print("New Rating: $newRating");
            },
          )
        : RatingBarIndicator(
            rating: rating,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: starCount,
            itemSize: size,
            direction: Axis.horizontal,
          );
  }
}
