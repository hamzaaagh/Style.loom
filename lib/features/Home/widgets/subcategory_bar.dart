import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/features/Home/presentation/manager/fetch_Sub_Category_cubit/fetch_subcategory_cubit.dart';

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

    return BlocBuilder<FetchSubcategoryCubit, FetchSubcategoryState>(
      builder: (context, state) {
        if (state is FetchSubcategorySuccess) {
          print(state.toString());
          return Container(
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.subcategories.length,
              itemBuilder: (context, mainIndex) {
                final subItems = state.subcategories[mainIndex].subCategories!;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: subItems.map((subItem) {
                    final name = subItem.name!;
                    final image = subItem.imageUrl!;

                    return GestureDetector(
                      onTap: () => onSubCategorySelected?.call(name),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                child: Image.network(
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
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          );
        } else if (state is FetchSubcategoryFailure) {
          print("ddddd");
          return const SizedBox.shrink();
        } else {
          print(state.toString());
          return const SizedBox.shrink();
        }
      },
    );
  }
}
 //onTap: () => onSubCategorySelected?.call(name),