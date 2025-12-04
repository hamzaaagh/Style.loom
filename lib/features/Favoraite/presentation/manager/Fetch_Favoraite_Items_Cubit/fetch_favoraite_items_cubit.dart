import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/features/Favoraite/data/Favoraite_repo_Imp.dart';

part 'fetch_favoraite_items_state.dart';

class FetchFavoraiteItemsCubit extends Cubit<FetchFavoraiteItemsState> {
  final FavoraiteRepoImp favoraiteRepoImp;
  FetchFavoraiteItemsCubit(this.favoraiteRepoImp)
    : super(FetchFavoraiteItemsInitial());
  List<ProductModel> favoraiteProducts = [];
 
  }

