// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:style/core/Widgets/Circular_Indector.dart';
// import 'package:style/features/Home/widgets/product_card.dart';
// import 'package:style/features/Product_Details/presentation/manager/Fetch_Similiar_Item_Cubit/fetch_similiar_item_cubit.dart';

// class SimiliarProductsListView extends StatelessWidget {
//   const SimiliarProductsListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FetchSimiliarItemCubit, FetchSimiliarItemState>(
//       builder: (context, state) {
//         if (state is FetchSimiliarItemSucces) {
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return ProductCard(product: state.similiarproducts[index]);
//             },
//           );
//         } else {
//           return Center(child: CircularIndector());
//         }
//       },
//     );
//   }
// }
