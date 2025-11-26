import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/Widgets/Circular_Indector.dart';

import 'package:style/features/Product_Details/presentation/manager/Fetch_Similiar_Item_Cubit/fetch_similiar_item_cubit.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/Similar_Product_Item.dart';

class SimiliarProductsListView extends StatefulWidget {
  const SimiliarProductsListView({super.key, required this.product});
  final ProductModel product;

  @override
  State<SimiliarProductsListView> createState() =>
      _SimiliarProductsListViewState();
}

class _SimiliarProductsListViewState extends State<SimiliarProductsListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _stopScroll() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.offset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSimiliarItemCubit, FetchSimiliarItemState>(
      builder: (context, state) {
        if (state is FetchSimiliarItemSucces) {
          final items = state.similiarproducts;

          if (items.isEmpty) {
            return SizedBox(
              height: 150,
              child: const Center(child: Text('No similar items')),
            );
          }

          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                final product = items[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SimilarProductItem(
                    product: product,
                    onTap: _stopScroll,
                  ),
                );
              },
            ),
          );
        } else {
          return Center(child: CircularIndector());
        }
      },
    );
  }
}
