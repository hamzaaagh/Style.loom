import 'package:flutter/material.dart';
import 'package:style/core/Consts/color_consts.dart';

class ProductQuantityCounter extends StatefulWidget {
  final int initialQuantity;
  final ValueChanged<int>? onQuantityChanged;
  final double height;
  final double width;

  const ProductQuantityCounter({
    super.key,
    this.initialQuantity = 1,
    this.onQuantityChanged,
    this.height = 45,
    this.width = 130,
  });

  @override
  State<ProductQuantityCounter> createState() => _ProductQuantityCounterState();
}

class _ProductQuantityCounterState extends State<ProductQuantityCounter> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void _increase() {
    setState(() => quantity++);
    widget.onQuantityChanged?.call(quantity);
  }

  void _decrease() {
    if (quantity > 1) {
      setState(() => quantity--);
      widget.onQuantityChanged?.call(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Consts.brown65,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Consts.black12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // زر الإنقاص
          IconButton(
            onPressed: _decrease,
            icon: const Icon(Icons.remove_rounded),
            color: Consts.black10,
          ),

          // عرض العدد
          Text(
            '$quantity',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          // زر الإضافة
          IconButton(
            onPressed: _increase,
            icon: const Icon(Icons.add_rounded),
            color: Consts.black10,
          ),
        ],
      ),
    );
  }
}
