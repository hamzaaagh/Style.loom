import 'package:flutter/material.dart';

import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/Widgets/Confirm_Dialog.dart';

class FavoraiteListViewItem extends StatelessWidget {
  const FavoraiteListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Text("Image"),
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
                      "Shirt",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "22 \$",
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
                        "This is descreption of the product This is descreption of the product",
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
                    InkWell(
                      onTap: () {
                        showConfirmDialog(
                          context: context,
                          title: "Add to cart",
                          message:
                              "Are you sure you want to add this item to your cart?",
                          onConfirm: () {},
                        );
                      },
                      child: Icon(
                        Icons.shopping_cart_checkout,
                        color: Consts.brown60,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        showConfirmDialog(
                          context: context,
                          title: 'Remove from Favorites',
                          message:
                              'Are you sure you want to remove this item from your favorites?',
                          onConfirm: () {
                            // تنفيذ القرار
                          },
                        );
                      },
                      child: Icon(
                        Icons.do_disturb_on_outlined,
                        color: Color(0xFFE74C3C),
                      ),
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
