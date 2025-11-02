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

 

  @override
  Widget build(BuildContext context) {
   

    return BlocBuilder<FetchSubcategoryCubit, FetchSubcategoryState>(
      builder: (context, state) {
        if (state is FetchSubcategorySuccess) {
          final allSubCats = state.subcategories
    .expand((e) => e.subCategories!)
    .toList();
          print(state.toString());
          return Container(
  height: 80,
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: allSubCats.length,
    itemBuilder: (context, i) {
      final sub = allSubCats[i];

      return SubCategoryItem(
        image: sub.imageUrl ?? "",
        category: sub.name ?? "",
        onSubCategorySelected: onSubCategorySelected,
      );
    },
  ),
);
        } else if (state is FetchSubcategoryFailure) {
          print("failure");
          return const SizedBox.shrink();
        } else {
          print(state.toString());
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class SubCategoryItem extends StatelessWidget {
  final String category;
  final String image;
  final Function(String)? onSubCategorySelected;

  const SubCategoryItem({
    super.key,
    required this.category,
    required this.image,
    this.onSubCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSubCategorySelected?.call(category),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 36, height: 36,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white10),
              child: ClipOval(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.category_outlined, color: Colors.white24),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              category,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
 //onTap: () => onSubCategorySelected?.call(name),