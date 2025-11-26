import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/utils/Api/api.dart';
import 'package:style/features/Product_Details/data/Product_View_repo_Imp.dart';
import 'package:style/features/Product_Details/presentation/manager/Fetch_Similiar_Item_Cubit/fetch_similiar_item_cubit.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/Product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => FetchSimiliarItemCubit(
            productimp: ProductViewRepoImp(api: Api(dio: Dio())),
          )..fetchSimiliarproductsitem(product: product),
          child: ProductDetailsViewBody(product: product),
        ),
      ),
    );
  }
}
