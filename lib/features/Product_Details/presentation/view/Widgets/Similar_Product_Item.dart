import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/features/Favoraite/presentation/manager/Fetch_Favoraite_Items_Cubit/fetch_favoraite_items_cubit.dart';
import 'package:style/features/Product_Details/presentation/view/Product_details_view.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFavoraiteItemsCubit, FetchFavoraiteItemsState>(
      builder: (context, state) {
        final cubit = context.watch<FetchFavoraiteItemsCubit>();
        final isFav = cubit.favoraiteProducts.contains(widget.product);
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // settings: RouteSettings(arguments: widget.product),
                builder: (context) =>
                    ProductDetailsView(product: widget.product),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.network(
                            widget.product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                cubit.addToFavoraite(widget.product);
                                setState(() {});
                              },
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${widget.product.price.toString()}\$",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  FavoriteIcon({super.key});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  IconData icon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Consts.brown65,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: InkWell(
          onTap: () {
            icon = Icons.favorite_border == icon
                ? Icons.favorite
                : Icons.favorite_border;
            setState(() {});
          },
          child: Icon(icon, color: Colors.red, size: 30),
        ),
      ),
    );
  }
}
