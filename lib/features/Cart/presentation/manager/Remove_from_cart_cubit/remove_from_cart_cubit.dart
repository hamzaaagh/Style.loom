import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style/core/Models/cart/item.model.dart';

import 'package:style/features/Cart/Data/Cart_Repo_Imp.dart';

part 'remove_from_cart_state.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  final CartRepoImp cartRepoImp;
  RemoveFromCartCubit({required this.cartRepoImp})
    : super(RemoveFromCartInitial());
  Future<void> removeFromCart({
    required Item product,
    required int userId,
  }) async {
    emit(RemoveFromCartLoading());
    final result = await cartRepoImp.removeFromCart(
      product: product,
      userId: userId,
    );
    result.fold(
      (failure) =>
          emit(RemoveFromCartFailure(errorMessage: failure.errormessage)),
      (_) => emit(RemoveFromCartSuccess()),
    );
  }
}
