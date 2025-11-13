import 'package:flutter/material.dart';
import 'package:style/core/Consts/color_consts.dart';

class CustomBottom extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;

  const CustomBottom({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onPressed,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: color == null ? Colors.white70 : Colors.white,
            width: 2,
          ),
          gradient: color == null
              ? LinearGradient(
                  colors: [
                    Consts.brown60,
                    Consts.brown65,
                    Consts.brown70,
                    Consts.brown80,
                    Consts.brown90,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : LinearGradient(colors: [color!, color!]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          //width: double.infinity,
          alignment: Alignment.center,
          constraints: const BoxConstraints(minHeight: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color == null ? Consts.black06 : Colors.white,
                size: 25,
              ),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: color == null ? Consts.black06 : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
