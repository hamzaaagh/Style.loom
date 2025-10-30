import 'package:flutter/material.dart';

class SubCategoryBar extends StatelessWidget {
  final String selectedCategory;
  final Function(String)? onSubCategorySelected;

   SubCategoryBar({
    super.key,
    required this.selectedCategory,
    this.onSubCategorySelected,
  });

  final Map<String, List<Map<String, String>>> subCategoriesWithImages = {
    'All': [
      {'name': 'All', 'image': 'assets/subcategory/all.png'},
      {'name': 'Tops', 'image': 'assets/subcategory/tops.png'},
      {'name': 'Bottoms', 'image': 'assets/subcategory/bottoms.png'},
      {'name': 'Shoes', 'image': 'assets/subcategory/shoes.png'},
      {'name': 'Accessories', 'image': 'assets/subcategory/accessories.png'},
    ],
    'Man': [
      {'name': 'Shirts', 'image': 'assets/subcategory/shirts.png'},
      {'name': 'Pants', 'image': 'assets/subcategory/pants.png'},
      {'name': 'Jackets', 'image': 'assets/subcategory/jackets.png'},
      {'name': 'Sneakers', 'image': 'assets/subcategory/sneakers.png'},
    ],
    'Woman': [
      {'name': 'Dresses', 'image': 'assets/subcategory/dresses.png'},
      {'name': 'Blouses', 'image': 'assets/subcategory/blouses.png'},
      {'name': 'Jeans', 'image': 'assets/subcategory/jeans.png'},
      {'name': 'Heels', 'image': 'assets/subcategory/heels.png'},
    ],
    'Kids': [
      {'name': 'T-Shirts', 'image': 'assets/subcategory/tshirts.png'},
      {'name': 'Shorts', 'image': 'assets/subcategory/shorts.png'},
      {'name': 'Hats', 'image': 'assets/subcategory/hats.png'},
      {'name': 'Socks', 'image': 'assets/subcategory/socks.png'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final items = subCategoriesWithImages[selectedCategory] ?? [];

    if (items.isEmpty) return const SizedBox.shrink();

    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          final name = item['name']!;
          final image = item['image']!;

          return GestureDetector(
            onTap: () => onSubCategorySelected?.call(name),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white10,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.category_outlined,
                        color: Colors.white24,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
