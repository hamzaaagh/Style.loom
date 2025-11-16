// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:style/core/Widgets/ButtonNavBar.dart';
// import 'package:style/features/Favoraite/data/Favoraite_repo_Imp.dart';
// import 'package:style/features/Favoraite/presentation/manager/Fetch_Favoraite_Items_Cubit/fetch_favoraite_items_cubit.dart';
// import 'package:style/features/Favoraite/presentation/view/Widgets/Favoraite_View_Body.dart';

// class FavoraiteView extends StatelessWidget {
//   const FavoraiteView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: BlocProvider(
//         create: (context) => FetchFavoraiteItemsCubit(FavoraiteRepoImp()),
//         child: Scaffold(
//           body: FavoraiteViewBody(),
//           bottomNavigationBar: Buttonnavbar(currentIndex: 2),
//         ),
//       ),
//     );
//   }
// }
