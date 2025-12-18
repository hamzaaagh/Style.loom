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
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final horizontalPadding = w > 200 ? 20.0 : 12.0;
        final verticalPadding = w > 200 ? 12.0 : 8.0;
        final iconSize = w > 200 ? 25.0 : 20.0;
        final fontSize = w > 200 ? 20.0 : 14.0;

        return InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onPressed,
          child: Ink(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: color == null ? Colors.white70 : Colors.white,
                width: 2,
              ),
              gradient: color == null
                  ? const LinearGradient(
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
              borderRadius: BorderRadius.circular(28),
            ),
            child: Container(
              height: 35,
              alignment: Alignment.center,
              constraints: const BoxConstraints(minHeight: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: color == null ? Consts.black06 : Colors.white,
                    size: iconSize,
                  ),
                  SizedBox(width: w > 120 ? 10 : 6),
                  Flexible(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: color == null ? Consts.black06 : Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
