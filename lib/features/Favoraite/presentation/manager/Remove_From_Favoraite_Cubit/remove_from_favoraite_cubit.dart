import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style/features/Favoraite/data/Favoraite_repo.dart';
import 'package:style/core/Models/product_model/product_model.dart';

part 'remove_from_favoraite_state.dart';

class RemoveFromFavoraiteCubit extends Cubit<RemoveFromFavoraiteState> {
  final FavoraiteRepo repo;

  RemoveFromFavoraiteCubit(this.repo) : super(RemoveFavoraiteInitial());

  Future<void> removefromfavoraite(ProductModel product,int userId) async {
    emit(RemoveFavoraiteLoading());

    try {
      await repo.removeFromFavoraite(product,userId);
      emit(RemoveFavoraiteSuccess());
    } catch (e) {
      emit(RemoveFavoraiteFailure(e.toString()));
    }
  }
}
