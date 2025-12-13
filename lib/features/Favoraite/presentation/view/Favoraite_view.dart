import 'package:flutter/material.dart';
import 'package:style/core/Consts/color_consts.dart';

import 'package:style/core/Widgets/ButtonNavBar.dart';
import 'package:style/features/Favoraite/presentation/view/Widgets/Favoraite_View_Body.dart';

class FavoraiteView extends StatelessWidget {
  const FavoraiteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Consts.black12,
          title: const Text(
            'WishList',
            style: TextStyle(
              color: Consts.brown70,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: FavoraiteViewBody(),
        bottomNavigationBar: Buttonnavbar(currentIndex: 2),
      ),
    );
  }
}
