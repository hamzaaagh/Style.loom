import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:style/core/Widgets/Circular_Indector.dart';
import 'package:style/features/Favoraite/presentation/manager/Fetch_Favoraite_Items_Cubit/fetch_favoraite_items_cubit.dart';

class FavoraiteViewBody extends StatefulWidget {
  const FavoraiteViewBody({super.key});

  @override
  State<FavoraiteViewBody> createState() => _FavoraiteViewBodyState();
}

class _FavoraiteViewBodyState extends State<FavoraiteViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<FetchFavoraiteItemsCubit>().getFavoraiteItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFavoraiteItemsCubit, FetchFavoraiteItemsState>(
      builder: (context, state) {
        if (state is FetchFavoraiteItemsSucces) {
          print(state.toString());
          print(state.products.length);
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return Text(state.products[index].name.toString());
            },
          );
        } else {
          print(state.toString());
          return Center(child: CircularIndector());
        }
      },
    );
  }
}
