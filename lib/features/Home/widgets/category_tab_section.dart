import 'package:flutter/material.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/features/Home/widgets/product_grid.dart';
import 'package:style/features/Home/widgets/subcategory_bar.dart';

class CategoryTabSection extends StatefulWidget {
  const CategoryTabSection({super.key});

  @override
  State<CategoryTabSection> createState() => _CategoryTabSectionState();
}

class _CategoryTabSectionState extends State<CategoryTabSection> {
  final Color backgroundColor = Consts.black12;
  final Color selectedTabColor = Consts.brown65;
  final Color unselectedTabColor = Colors.white70;
  final Color indicatorColor = Consts.brown65;
  final double tabFontSize = 18;

  // ✅ بيانات مؤقتة
  final Map<String, List<Map<String, String>>> productsByCategory = {
    'All': List.generate(8, (i) => {'name': 'Product ${i + 1}', 'image': ''}),
    'Man': List.generate(4, (i) => {'name': 'Man ${i + 1}', 'image': ''}),
    'Woman': List.generate(4, (i) => {'name': 'Woman ${i + 1}', 'image': ''}),
    'Kids': List.generate(4, (i) => {'name': 'Kids ${i + 1}', 'image': ''}),
  };

  void onTabChanged(int index) {
    final categories = ['All', 'Man', 'Woman', 'Kids'];
    debugPrint('Selected tab: ${categories[index]}');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            TabBar(
              onTap: onTabChanged,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: indicatorColor),
                insets: const EdgeInsets.symmetric(horizontal: 24),
              ),
              labelColor: selectedTabColor,
              unselectedLabelColor: unselectedTabColor,
              labelStyle: TextStyle(fontSize: tabFontSize, fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(fontSize: tabFontSize),
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
                children: [
                  _buildCategoryWithSubCategory('All'),
                  _buildCategoryWithSubCategory('Man'),
                  _buildCategoryWithSubCategory('Woman'),
                  _buildCategoryWithSubCategory('Kids'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryWithSubCategory(String category) {
    return Column(
      children: [
        SubCategoryBar(
          selectedCategory: category,
          onSubCategorySelected: (subCategory) {
            debugPrint('Selected sub-category: $subCategory');
          },
        ),
        Expanded(
          child: ProductGrid(
            category: category,
            products: productsByCategory[category] ?? [],
          ),
        ),
      ],
    );
  }
}
