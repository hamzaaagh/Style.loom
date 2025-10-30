import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/features/Home/data/Repo/Home_Repo.dart';

part 'fetch_product_model_state.dart';

class FetchProductModelCubit extends Cubit<FetchProductModelState> {
  final HomeRepo homeRepo;
  FetchProductModelCubit(this.homeRepo) : super(FetchProductModelInitial());
  Future<void> fetchproductmodel({required int mainId}) async {
    emit(FetchProductModelLoading());
    var result = await homeRepo.fetchproductmodel(mainId: mainId);
    result.fold(
      (failur) {
        emit(FetchProductModelFailure(errmessage: failur.errormessage));
      },
      (products) {
        emit(FetchProductModelSucces(products: products));
      },
    );
  }
}
