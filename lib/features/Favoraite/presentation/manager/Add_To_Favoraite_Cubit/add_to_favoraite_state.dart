part of 'add_to_favoraite_cubit.dart';

sealed class AddToFavoraiteState extends Equatable {
  const AddToFavoraiteState();

  @override
  List<Object> get props => [];
}

final class AddToFavoraiteInitial extends AddToFavoraiteState {}

final class AddToFavoraiteLoading extends AddToFavoraiteState {}

final class AddToFavoraiteFailure extends AddToFavoraiteState {
  final String errmessage;

  const AddToFavoraiteFailure(this.errmessage);

  
}

final class AddToFavoraiteSuccess extends AddToFavoraiteState {}
