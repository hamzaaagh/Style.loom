import 'package:flutter/material.dart';
import 'package:style/core/Consts/color_consts.dart';

import 'package:style/features/Favoraite/presentation/view/Widgets/Favoraite_View_Body.dart';

class FavoraiteView extends StatefulWidget {
  const FavoraiteView({super.key});

  @override
  State<FavoraiteView> createState() => _FavoraiteViewState();
}

class _FavoraiteViewState extends State<FavoraiteView> {
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
      ),
    );
  }
}
