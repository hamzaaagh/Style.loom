part of 'remove_from_favoraite_cubit.dart';

sealed class RemoveFromFavoraiteState extends Equatable {
  const RemoveFromFavoraiteState();

  @override
  List<Object?> get props => [];
}

final class RemoveFavoraiteInitial extends RemoveFromFavoraiteState {}

final class RemoveFavoraiteLoading extends RemoveFromFavoraiteState {}

final class RemoveFavoraiteFailure extends RemoveFromFavoraiteState {
  final String errmessage;
  const RemoveFavoraiteFailure(this.errmessage);

  @override
  List<Object?> get props => [errmessage];
}

final class RemoveFavoraiteSuccess extends RemoveFromFavoraiteState {}
