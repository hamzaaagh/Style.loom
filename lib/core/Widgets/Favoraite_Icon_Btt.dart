import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/features/Favoraite/presentation/manager/Add_To_Favoraite_Cubit/add_to_favoraite_cubit.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key? key, required this.product}) : super(key: key);
  final ProductModel product;
  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,

        color: isFavorite ? Colors.red : Colors.black,
        size: 20,
        fontWeight: FontWeight.normal,
      ),
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        BlocProvider.of<AddToFavoraiteCubit>(context).add(widget.product, 1);
      },
    );
  }
}
