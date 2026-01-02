import 'package:flutter/material.dart';

import 'package:style/core/Widgets/ButtonNavBar.dart';
import 'package:style/features/Cart/presentation/View/Cart_View.dart';
import 'package:style/features/Favoraite/presentation/view/Favoraite_view.dart';
import 'package:style/features/Home/presentation/view/Home_View.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeView(),
    CartView(),
    FavoraiteView(),
    HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: Buttonnavbar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
