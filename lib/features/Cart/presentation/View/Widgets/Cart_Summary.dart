import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/features/Cart/presentation/manager/Fetch_cart_items.dart/fetch_cart_items_cubit.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: BlocBuilder<FetchCartItemsCubit, FetchCartItemsState>(
            builder: (context, state) {
              if (state is FetchCartItemsSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          return ItemPriceRow(
                            title: "Item ${++index}",
                            price: state.items[index - 1].product!.price!,
                          );
                        },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                      Divider(
                        thickness: 2,
                        color: Consts.gray50,
                        radius: BorderRadius.circular(10),
                      ),

                      ItemPriceRow(
                        title: "Total Price",
                        price: state.items.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element.product!.price!,
                        ),
                      )..istotal = true,
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "Unable to load summary",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemPriceRow extends StatelessWidget {
  ItemPriceRow({super.key, required this.title, required this.price});
  final String title;
  final num price;
  bool istotal = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: istotal ? 20 : 16,
            fontWeight: istotal ? FontWeight.bold : FontWeight.w400,
          ),
        ),
        Text(
          "$price \$",
          style: TextStyle(
            color: Color(0xFFC9A96A),
            fontSize: istotal ? 20 : 16,
            fontWeight: istotal ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
