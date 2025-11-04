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

          return Container(
            height:MediaQuery.of(context).size.height * 0.16,
            margin: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 8,
              bottom: 10,
            ),
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
          return const SizedBox.shrink();
        } else {
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
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 8,bottom: 4,right: 8,left: 8),
            width: MediaQuery.of(context).size.height * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              color: Colors.white24,
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.category_outlined, color: Colors.white24),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            category,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
 //onTap: () => onSubCategorySelected?.call(name),