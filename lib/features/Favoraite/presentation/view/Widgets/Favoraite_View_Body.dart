import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/core/Widgets/Custom_Bottom.dart';
import 'package:style/features/Favoraite/presentation/view/Widgets/Favoraite_list_view_item.dart';

class FavoraiteViewBody extends StatefulWidget {
  const FavoraiteViewBody({super.key});

  @override
  State<FavoraiteViewBody> createState() => _FavoraiteViewBodyState();
}

class _FavoraiteViewBodyState extends State<FavoraiteViewBody> {
  final ScrollController _scrollController = ScrollController();

  bool _showButton = false;
  double _lastScrollPosition = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final currentPosition = _scrollController.position.pixels;
    final maxPosition = _scrollController.position.maxScrollExtent;

    if (currentPosition >= maxPosition - 20) {
      if (!_showButton) {
        setState(() => _showButton = true);
      }
    }

    if (currentPosition < _lastScrollPosition) {
      if (_showButton) {
        setState(() => _showButton = false);
      }
    }

    _lastScrollPosition = currentPosition;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const FavoraiteListViewItem();
            },
          ),
        ),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _showButton
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  child: CustomBottom(
                    key: const ValueKey('bottom_button'),
                    text: "Add All To Cart",
                    onPressed: () {},
                    icon: Icons.shopping_cart,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

