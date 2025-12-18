import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/Widgets/ButtonNavBar.dart';
import 'package:style/features/Cart/presentation/View/Widgets/Cart_View_Body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

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
        body: const CartViewBody(),
        bottomNavigationBar: Buttonnavbar(currentIndex: 1),
      ),
    );
  }
}
