part of 'favorite_action_cubit.dart';

sealed class FavoriteActionState {
  const FavoriteActionState();
}

final class FavoriteActionInitial extends FavoriteActionState {}

final class ToggleFavoriteAction extends FavoriteActionState {
  final String productId;
  final bool isFav;
  const ToggleFavoriteAction(this.productId, this.isFav);
}
