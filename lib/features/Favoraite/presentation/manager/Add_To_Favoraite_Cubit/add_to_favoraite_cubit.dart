import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/features/Favoraite/data/Favoraite_repo.dart';

part 'add_to_favoraite_state.dart';

class AddToFavoraiteCubit extends Cubit<AddToFavoraiteState> {
  final FavoraiteRepo repo;

  AddToFavoraiteCubit(this.repo) : super(AddToFavoraiteInitial());

  Future<void> add(ProductModel product, int userId) async {
    emit(AddToFavoraiteLoading());

    var result = await repo.addToFavoraite(product, userId);

    result.fold(
      (failure) => emit(AddToFavoraiteFailure(failure.errormessage)),
      (_) => emit(AddToFavoraiteSuccess()),
    );
  }
}
