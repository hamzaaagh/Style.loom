import 'package:flutter/widgets.dart';
import 'package:style/features/Home/widgets/carousel_section.dart';
import 'package:style/features/Home/widgets/category_tab_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          CarouselSection(),
          CategoryTabSection(),
        ],
      ),
    );
  }
}
