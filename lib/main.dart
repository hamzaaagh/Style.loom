import 'package:flutter/material.dart';
import 'package:style/features/Auth/presentation/view/Auth_View.dart';

void main() {
  runApp(const style_loom());
}

class style_loom extends StatelessWidget {
  const style_loom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Roboto"),
      home: AuthView(),
    );
  }
}
