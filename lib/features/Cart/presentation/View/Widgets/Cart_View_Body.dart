import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/core/Widgets/Confirm_Dialog.dart';

import 'package:style/core/Widgets/Custom_Bottom.dart';
import 'package:style/features/Cart/presentation/View/Widgets/Cart_Summary.dart';

import 'package:style/features/Cart/presentation/View/Widgets/Cart_View_Item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return CartViewItem();
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
