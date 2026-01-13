part of 'fetch_cart_items_cubit.dart';

sealed class FetchCartItemsState extends Equatable {
  const FetchCartItemsState();

  @override
  List<Object> get props => [];
}

final class FetchCartItemsInitial extends FetchCartItemsState {}

final class FetchCartItemsLoading extends FetchCartItemsState {}



final class FetchCartItemsSuccess extends FetchCartItemsState {
  final List<Item> items;

  const FetchCartItemsSuccess({required this.items});
}

final class FetchCartItemsFailure extends FetchCartItemsState {
  final String errorMessage;

  const FetchCartItemsFailure({required this.errorMessage});
}
