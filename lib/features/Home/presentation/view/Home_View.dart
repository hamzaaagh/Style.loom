import 'package:flutter/material.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/Widgets/ButtonNavBar.dart';
import 'package:style/features/Home/widgets/carousel_section.dart';
import 'package:style/features/Home/widgets/category_tab_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // no fixed height calculation needed when the whole Home is one scrollable
    // block; children will size themselves and the parent SingleChildScrollView
    // will handle vertical scrolling.
    return Scaffold(
      backgroundColor: Consts.black12,
      appBar: AppBar(
        backgroundColor: Consts.black12,
        elevation: 0,
        title: Text(
          "Style.Loom",
          style: TextStyle(
            color: Consts.brown60,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // 🔔 هنا مستقبلاً ممكن تفتح صفحة الإشعارات
            },
            icon: Icon(
              Icons.notifications_outlined,
              color: Consts.brown60,
              size: 28,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // ✅ Wrap whole content in a SingleChildScrollView and give the
      // CategoryTabSection a bounded height to avoid unbounded constraints.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            CarouselSection(),
            CategoryTabSection(),
          ],
        ),
      ),
      bottomNavigationBar: Buttonnavbar(currentIndex: 0),
    );
  }
}
