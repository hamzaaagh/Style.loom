import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/Widgets/Custom_Bottom.dart';
import 'package:style/core/functions/show_snack_bar.dart';
import 'package:style/features/Cart/presentation/manager/Add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:style/features/Cart/presentation/manager/Fetch_cart_items.dart/fetch_cart_items_cubit.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/Custom_Expansion_Tile.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/Similiar_Products_List_view.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_quantity_counter.dart';
import 'package:style/features/Product_Details/presentation/view/Widgets/product_rating_stars.dart';

class ProductDetailsSection extends StatelessWidget {
  final ProductModel model;

  const ProductDetailsSection({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    int quantity = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name!,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Consts.brown65,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Text(
                model.subCategory!.main!.name!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                model.subCategory!.name!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            "\$ ${model.price!.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Consts.brown65,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ProductRatingStars(rating: 3.5),
              const SizedBox(width: 5),
              const Text(
                "(10)",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "Select quantity:",
            style: TextStyle(
              fontSize: 20,
              color: Consts.brown60,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          ProductQuantityCounter(
            initialQuantity: 1,
            onQuantityChanged: (value) {
              quantity = value;
              // Handle quantity change if needed
            },
          ),
          const SizedBox(height: 20),
          CustomExpansionTile(
            title: "Discreption",
            longtitle: model.description!,
          ),
          CustomExpansionTile(title: "Reviews", longtitle: "This is reviews "),
          const SizedBox(height: 30),
          // Responsive buttons: side-by-side on wide screens, stacked on narrow
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 360;
              if (isNarrow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BlocConsumer<AddToCartCubit, AddToCartState>(
                      builder: (context, state) {
                        return CustomBottom(
                          color: Consts.black10,
                          text: switch (state) {
                            AddToCartLoading() => 'Adding...',
                            AddToCartSuccess() => 'Added',
                            AddToCartFailure() => 'Try Again',
                            _ => 'Add to Cart',
                          },
                          onPressed: () {
                            print(state);
                            BlocProvider.of<AddToCartCubit>(context).addToCart(
                              product: model,
                              userId: 1, // Replace with actual user ID
                              quantity: quantity,
                            );
                          },
                          icon: Icons.card_giftcard,
                        );
                      },
                      listener: (context, state) {
                        if (state is AddToCartFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)),
                          );
                        } else if (state is AddToCartSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Product added to cart'),
                            ),
                          );
                          context.read<FetchCartItemsCubit>().fetchCartItems(
                            userId: 1,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomBottom(
                      text: "Buy Now",
                      onPressed: () {
                        print("object");
                      },
                      icon: Icons.shopping_bag,
                    ),
                  ],
                );
              }

              return Row(
                children: [
                  // Give Add to Cart a slightly larger share of the width
                  Expanded(
                    flex: 1,
                    child: BlocConsumer<AddToCartCubit, AddToCartState>(
                      builder: (context, state) {
                        return CustomBottom(
                          color: Consts.black10,
                          text: switch (state) {
                            AddToCartLoading() => 'Adding...',
                            AddToCartSuccess() => 'Added',
                            AddToCartFailure() => 'Try Again',
                            _ => 'Add to Cart',
                          },

                          onPressed: () {
                            BlocProvider.of<AddToCartCubit>(context).addToCart(
                              product: model,
                              userId: 1, // Replace with actual user ID
                              quantity: quantity,
                            );
                            if (state is AddToCartFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorMessage)),
                              );
                            }
                          },
                          icon: Icons.card_giftcard,
                        );
                      },
                      listener: (context, state) {
                        if (state is AddToCartFailure) {
                          showSnackBar(
                            message: "failed add to cart",
                            state: false,
                            context: context,
                          );
                        } else if (state is AddToCartSuccess) {
                          showSnackBar(message: "Added to cart succesfully", state: true, context: context);
                          context.read<FetchCartItemsCubit>().fetchCartItems(
                            userId: 1,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    flex: 1,
                    child: CustomBottom(
                      text: "Buy Now",
                      onPressed: () {},
                      icon: Icons.shopping_bag,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 25),
          const Text(
            "Similiar Products",
            style: TextStyle(
              color: Consts.brown70,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              height: 150,
              child: SimiliarProductsListView(product: model),
            ),
          ),
        ],
      ),
    );
  }
}
