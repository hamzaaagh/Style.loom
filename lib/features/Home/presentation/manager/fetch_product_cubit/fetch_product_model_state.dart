part of 'fetch_product_model_cubit.dart';

sealed class FetchProductModelState extends Equatable {
  const FetchProductModelState();

  @override
  List<Object> get props => [];
}

final class FetchProductModelInitial extends FetchProductModelState {}

final class FetchProductModelLoading extends FetchProductModelState {}

final class FetchProductModelSucces extends FetchProductModelState {}

final class FetchProductModelFailure extends FetchProductModelState {
  final String errmessage;

  const FetchProductModelFailure({required this.errmessage});
}
