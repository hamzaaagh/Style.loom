
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:style/core/Models/product_model/product_model.dart';

import 'package:style/features/Product_Details/presentation/view/Widgets/Product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => FetchSimiliarItemCubit(
    //     id:product.id! ,
    //     productimp: ProductViewRepoImp(api: Api(dio: Dio()))),
    return Scaffold(
      body: SafeArea(child: ProductDetailsViewBody(product: product)),
    );
  }
}
