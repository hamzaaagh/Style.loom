part of 'remove_from_cart_cubit.dart';

sealed class RemoveFromCartState extends Equatable {
  const RemoveFromCartState();

  @override
  List<Object> get props => [];
}

final class RemoveFromCartInitial extends RemoveFromCartState {}

final class RemoveFromCartLoading extends RemoveFromCartState {}

final class RemoveFromCartSuccess extends RemoveFromCartState {}

final class RemoveFromCartFailure extends RemoveFromCartState {
  final String errorMessage;

  const RemoveFromCartFailure({required this.errorMessage});
}
