// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:style/core/Consts/color_consts.dart';

class Buttonnavbar extends StatefulWidget {
  Buttonnavbar({super.key});

  @override
  State<Buttonnavbar> createState() => _ButtonnavbarState();
  int currentIndex = 0;

  final icons = [
    HugeIcons.strokeRoundedHome07,
    HugeIcons.strokeRoundedShoppingCart02,
    HugeIcons.strokeRoundedFavourite,
    HugeIcons.strokeRoundedUserStory,
  ];
}

class _ButtonnavbarState extends State<Buttonnavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Consts.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.icons.length, (i) {
          final active = widget.currentIndex == i;

          return GestureDetector(
            onTap: () => setState(() => widget.currentIndex = i),
            child: Container(
              padding: EdgeInsets.all(active ? 6 : 4),
              decoration: BoxDecoration(
                color: active ? Consts.brown60 : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: HugeIcon(
                icon: widget.icons[i],
                size: active ? 36 : 30,
                color: active ? Colors.black12 : Colors.white60,
              ),
            ),
          );
        }),
      ),
    );
  }
}
