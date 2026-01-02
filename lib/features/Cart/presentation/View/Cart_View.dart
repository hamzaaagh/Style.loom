import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/utils/Api/api.dart';
import 'package:style/features/Cart/Data/Cart_Repo_Imp.dart';

import 'package:style/features/Cart/presentation/View/Widgets/Cart_View_Body.dart';
import 'package:style/features/Cart/presentation/manager/Fetch_cart_items.dart/fetch_cart_items_cubit.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  //  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Consts.black12,
          centerTitle: true,
          title: Text(
            "Cart",
            style: TextStyle(
              color: Consts.brown70,
              //fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocProvider(
          create: (context) => FetchCartItemsCubit(
            cartRepoImp: CartRepoImp(api: Api(dio: Dio())),
          )..fetchCartItems(userId: 1),
          child: const CartViewBody(),
        ),
      ),
    );
  }
}
