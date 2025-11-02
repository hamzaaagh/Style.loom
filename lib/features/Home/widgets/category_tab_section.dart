import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/features/Home/presentation/manager/fetch_Sub_Category_cubit/fetch_subcategory_cubit.dart';

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

    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        final id = tabController.index;
        context.read<FetchSubcategoryCubit>().fetchSubCategory(mainId: id);
        print(id);
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
      children: [
        SubCategoryBar(
          selectedCategory: category,
          onSubCategorySelected: (subCategory) {
            debugPrint('Selected subcategory → $subCategory');
          },
        ),
        // Expanded(
        //   child: BlocBuilder<FetchSubcategoryCubit, FetchSubcategoryState>(
        //     builder: (context, state) {
        //       if (state is FetchSubcategoryLoading) {
        //         return const Center(child: CircularProgressIndicator());
        //       } else if (state is FetchSubcategorySuccess) {
        //         return BlocBuilder<FetchProductModelCubit, FetchProductModelState>(

        //           builder: (context, state) {
        //             return ProductGrid(
        //               category: category,
        //               products: state.subcategories,
        //             );
        //           },
        //         );
        //       } else {
        //         return const SizedBox.shrink();
        //       }
        //     },
        //   ),
        // ),
      ],
    );
  }
}
