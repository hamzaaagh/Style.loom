// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:style/core/Widgets/Circular_Indector.dart';
// import 'package:style/features/Favoraite/presentation/manager/Fetch_Favoraite_Items_Cubit/fetch_favoraite_items_cubit.dart';

// class FavoraiteViewBody extends StatefulWidget {
//   const FavoraiteViewBody({super.key});

//   @override
//   State<FavoraiteViewBody> createState() => _FavoraiteViewBodyState();
// }

// class _FavoraiteViewBodyState extends State<FavoraiteViewBody> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<FetchFavoraiteItemsCubit>().getFavoraiteItems();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//            ListView.builder(
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return Text(state.products[index].name.toString());
//             },
//           );
       
     
//   }
// }
