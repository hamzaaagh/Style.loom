import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/core/Consts/color_consts.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.longtitle,
  });
  final String title;
  final String longtitle;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  bool _isExpanded = false;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap(bool expanded) {
    setState(() => _isExpanded = expanded);
    if (expanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ExpansionTile(
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        expandedAlignment: Alignment.centerLeft,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        collapsedBackgroundColor: Consts.gray50,
        onExpansionChanged: _handleTap,
        backgroundColor: Consts.gray50,
        collapsedIconColor: Colors.white,
        trailing: RotationTransition(
          turns: Tween(begin: 0.0, end: 0.25).animate(_controller),
          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              widget.longtitle,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
