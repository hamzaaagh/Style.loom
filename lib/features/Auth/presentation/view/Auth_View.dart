import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/features/Auth/presentation/view/Widgets/Auth_View_Body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: AuthViewBody()));
  }
}
