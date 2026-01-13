import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Widgets/Circular_Indector.dart';
import 'package:style/core/Widgets/Confirm_Dialog.dart';

import 'package:style/core/Widgets/Custom_Bottom.dart';
import 'package:style/features/Cart/presentation/View/Widgets/Cart_Summary.dart';

import 'package:style/features/Cart/presentation/View/Widgets/Cart_View_Item.dart';
import 'package:style/features/Cart/presentation/manager/Fetch_cart_items.dart/fetch_cart_items_cubit.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          BlocBuilder<FetchCartItemsCubit, FetchCartItemsState>(
            builder: (context, state) {
              
              if (state is FetchCartItemsSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    if (state.items.isEmpty) {
                      return Center(
                        child: Text(
                          "No Items in Cart",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      );
                    }
                    return CartViewItem(item: state.items[index]);
                  },
                );
              } else if (state is FetchCartItemsLoading) {
                return Center(child: CircularIndector());
              } else if (state is FetchCartItemsFailure) {
                
                return Center(child: Text(state.errorMessage));
              } else {
                return Center(
                  child: Text(
                    "Something went wrong!",
                   
                  ),
                );
              }
            },
          ),
          CartSummary(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CustomBottom(
              text: "Checkout",
              onPressed: () {
                showConfirmDialog(
                  context: context,
                  title: "Checkout",
                  message: "Are You Shur You Want to checkout?",
                  onConfirm: () {},
                );
              },
              icon: Icons.payment_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
