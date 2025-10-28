import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_product_model_state.dart';

class FetchProductModelCubit extends Cubit<FetchProductModelState> {
  FetchProductModelCubit() : super(FetchProductModelInitial());
}
