// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:style/core/Consts/color_consts.dart';

class Buttonnavbar extends StatelessWidget {
  Buttonnavbar({super.key, this.currentIndex = 0, required this.onTap});
  int currentIndex;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Consts.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(icons.length, (i) {
          final active = currentIndex == i;

          return InkWell(
            onTap: () => onTap(i),
            child: Container(
              padding: EdgeInsets.all(active ? 3 : 1),
              decoration: BoxDecoration(
                color: active ? Consts.brown60 : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: HugeIcon(
                icon: icons[i],
                size: active ? 30 : 20,
                color: active ? Colors.black12 : Colors.white60,
              ),
            ),
          );
        }),
      ),
    );
  }

  final icons = [
    HugeIcons.strokeRoundedHome07,
    HugeIcons.strokeRoundedShoppingCart02,
    HugeIcons.strokeRoundedFavourite,
    HugeIcons.strokeRoundedUserStory,
  ];
  // final labels = [HomeView(), CartView(), FavoraiteView(), HomeView()];
}
