import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/features/Home/presentation/manager/fetch_Sub_Category_cubit/fetch_subcategory_cubit.dart';
import 'package:style/features/Home/presentation/manager/fetch_product_cubit/fetch_product_model_cubit.dart';
import 'package:style/features/Home/widgets/product_grid.dart';

import 'package:style/features/Home/widgets/subcategory_bar.dart';

class CategoryTabSection extends StatefulWidget {
  const CategoryTabSection({super.key});

  @override
  State<CategoryTabSection> createState() => _CategoryTabSectionState();
}

class _CategoryTabSectionState extends State<CategoryTabSection>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final Map<String, int> categoryIds = {
    'All': 0,
    'Man': 1,
    'Woman': 2,
    'Kids': 3,
  };

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);

    context.read<FetchSubcategoryCubit>().fetchSubCategory(mainId: 0);
    context.read<FetchProductModelCubit>().fetchproductmodel(mainId: 0);

    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        final id = tabController.index;
        context.read<FetchSubcategoryCubit>().fetchSubCategory(mainId: id);
        context.read<FetchProductModelCubit>().fetchproductmodel(mainId: id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Consts.black12,
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: Consts.brown65),
              insets: EdgeInsets.symmetric(horizontal: 24),
            ),
            labelColor: Consts.brown65,
            unselectedLabelColor: Colors.white70,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Man'),
              Tab(text: 'Woman'),
              Tab(text: 'Kids'),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                _buildTabContent('All'),
                _buildTabContent('Man'),
                _buildTabContent('Woman'),
                _buildTabContent('Kids'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubCategoryBar(
          selectedCategory: category,
          onSubCategorySelected: (subCategory) {
            debugPrint('Selected subcategory → $subCategory');
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "Latest",
            style: TextStyle(
              color: Consts.brown70,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(child: ProductGrid()),
      ],
    );
  }
}
