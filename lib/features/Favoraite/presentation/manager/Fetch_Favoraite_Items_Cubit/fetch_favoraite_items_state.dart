part of 'fetch_favoraite_items_cubit.dart';

sealed class FetchFavoraiteItemsState extends Equatable {
  const FetchFavoraiteItemsState();

  @override
  List<Object> get props => [];
}

final class FetchFavoraiteItemsInitial extends FetchFavoraiteItemsState {}

final class FetchFavoraiteItemsloading extends FetchFavoraiteItemsState {}

final class FetchFavoraiteItemsFailure extends FetchFavoraiteItemsState {
  final String errmessage;

  const FetchFavoraiteItemsFailure({required this.errmessage});
}

final class FetchFavoraiteItemsSucces extends FetchFavoraiteItemsState {
  final List<ProductModel> products;

  const FetchFavoraiteItemsSucces({required this.products});
}
