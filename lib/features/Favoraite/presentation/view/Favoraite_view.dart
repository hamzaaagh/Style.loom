import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/features/Favoraite/presentation/view/Widgets/Favoraite_View_Body.dart';

class FavoraiteView extends StatelessWidget {
  const FavoraiteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: FavoraiteViewBody(),
    ));
  }
}