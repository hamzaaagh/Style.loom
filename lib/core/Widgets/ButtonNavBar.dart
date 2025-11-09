// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:style/core/Consts/color_consts.dart';
import 'package:style/features/Favoraite/presentation/view/Favoraite_view.dart';
import 'package:style/features/Home/presentation/view/Home_View.dart';

class Buttonnavbar extends StatefulWidget {
  Buttonnavbar({super.key, this.currentIndex = 0});
  int currentIndex;
  @override
  State<Buttonnavbar> createState() => _ButtonnavbarState();

  final icons = [
    HugeIcons.strokeRoundedHome07,
    HugeIcons.strokeRoundedShoppingCart02,
    HugeIcons.strokeRoundedFavourite,
    HugeIcons.strokeRoundedUserStory,
  ];
  final labels = [HomeView(), HomeView(), FavoraiteView(), HomeView()];
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

          return InkWell(
            onTap: () {
              widget.currentIndex = i;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return widget.labels[i];
                  },
                ),
              );
              setState(() {});
            },
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
