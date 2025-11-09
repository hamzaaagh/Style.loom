import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularIndector extends StatelessWidget {
  const CircularIndector({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
                color: kDefaultIconLightColor,
                backgroundColor: Colors.grey,
                strokeWidth: 5,
              );
  }
}