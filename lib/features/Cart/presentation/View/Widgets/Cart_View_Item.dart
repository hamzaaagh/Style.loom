import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/Consts/const_Ip_Adress.dart';
import 'package:style/core/Models/cart/item.model.dart';
import 'package:style/core/Widgets/Circular_Indector.dart';

import 'package:style/core/Widgets/Confirm_Dialog.dart';

class CartViewItem extends StatelessWidget {
  const CartViewItem({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    final imageurl =
        "http://${IPconsts.ipadress}:3000${item.product!.imageUrl}";
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            color: Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //هون الصورة
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: imageurl,
                    placeholder: (context, url) =>
                        const Center(child: CircularIndector()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.product!.name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${item.product!.price} \$",
                      style: TextStyle(color: Consts.brown60, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    // مو موجودين
                    // Text(
                    //   "Size : XL",
                    //   style: TextStyle(color: Colors.white, fontSize: 15),
                    // ),
                    // Text(
                    //   "Color : White",
                    //   style: TextStyle(color: Colors.white, fontSize: 15),
                    // ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        item.product!.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        showConfirmDialog(
                          context: context,
                          title: "Remove from cart",
                          message:
                              "Are You Shure You Want to Remove this Item from your cart?",
                          onConfirm: () {},
                        );
                      },
                      child: Icon(Icons.delete_sweep, color: Color(0xFFE74C3C)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
