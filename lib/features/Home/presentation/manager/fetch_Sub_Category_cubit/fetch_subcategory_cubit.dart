import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style/core/Models/product_model/sub_category.dart';

import 'package:style/features/Home/data/Repo/Home_Repo.dart';

part 'fetch_subcategory_state.dart';

class FetchSubcategoryCubit extends Cubit<FetchSubcategoryState> {
  final HomeRepo homeRepo;
  FetchSubcategoryCubit(this.homeRepo) : super(FetchSubcategoryInitial());
  Future<void> fetchSubCategory({required int mainId}) async {
    emit(FetchSubcategoryLoading());
    var result = await homeRepo.fetchsubcategory(mainId: mainId);
    result.fold(
      (failurs) {
        emit(FetchSubcategoryFailure(errmessage: failurs.errormessage));
      },
      (subCategories) {
        emit(FetchSubcategorySuccess(subcategories: subCategories));
      },
    );
  }
}
