part of 'fetch_subcategory_cubit.dart';

sealed class FetchSubcategoryState extends Equatable {
  const FetchSubcategoryState();

  @override
  List<Object> get props => [];
}

final class FetchSubcategoryInitial extends FetchSubcategoryState {}

final class FetchSubcategoryLoading extends FetchSubcategoryState {}

final class FetchSubcategorySuccess extends FetchSubcategoryState {
  final List<MainCategory> subcategories;

  const FetchSubcategorySuccess({required this.subcategories});
}

final class FetchSubcategoryFailure extends FetchSubcategoryState {
  final String errmessage;

  const FetchSubcategoryFailure({required this.errmessage});
}
