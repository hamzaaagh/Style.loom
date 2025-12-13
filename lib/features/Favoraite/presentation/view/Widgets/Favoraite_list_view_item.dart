import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:style/core/Consts/color_consts.dart';

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
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              colors: [Consts.gray40, Consts.gray50, Consts.gray70],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            //color: Consts.gray40,
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
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    // مو موجودين
                    Text(
                      "Size : XL",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      "Color : White",
                      style: TextStyle(color: Colors.white, fontSize: 15),
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
                    Icon(Icons.shopping_cart_checkout, color: Consts.black15),
                    Spacer(),
                    Icon(Icons.do_disturb_on_outlined, color: Colors.red),
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
