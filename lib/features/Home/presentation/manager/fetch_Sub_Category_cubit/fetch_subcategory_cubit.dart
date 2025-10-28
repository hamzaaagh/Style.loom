import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_subcategory_state.dart';

class FetchSubcategoryCubit extends Cubit<FetchSubcategoryState> {
  FetchSubcategoryCubit() : super(FetchSubcategoryInitial());
}
