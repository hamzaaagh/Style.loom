import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Widgets/Circular_Indector.dart';

import 'package:style/features/Home/presentation/manager/fetch_product_cubit/fetch_product_model_cubit.dart';
import 'package:style/features/Home/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // if (productcard.isEmpty) {
    //   return Center(
    //     child: Text(
    //       'No products in $category',
    //       style: const TextStyle(color: Colors.white70),
    //     ),
    //   );
    // }

    return Container(
      height: MediaQuery.of(context).size.height * 0.01,
      margin: EdgeInsets.all(8),
      child: BlocBuilder<FetchProductModelCubit, FetchProductModelState>(
        builder: (context, state) {
          print(state);
          if (state is FetchProductModelSucces) {
            return GridView.builder(
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(product: product);
              },
            );
          } else {
            return Center(
              child: CircularIndector(),
            );
          }
        },
      ),
    );
  }
}
