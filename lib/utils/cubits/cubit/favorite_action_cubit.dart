import 'package:delivery_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_action_state.dart';

class FavoriteActionCubit extends Cubit<FavoriteActionState> {
  FavoriteActionCubit() : super(FavoriteActionInitial());

  void toggleIsFavorite(String productId, [bool isRecommended = false]) {
    ProductModel product;
    if (isRecommended) {
      product = dummyDrinks.firstWhere(
        (product) => product.productId == productId,
      );
      product = dummyDrinks.firstWhere(
        (product) => product.productId == productId,
      );
      final index = dummyDrinks.indexOf(product);
      dummyDrinks[index] = dummyDrinks[index].copyWith(
        isFavorite: !dummyDrinks[index].isFavorite,
      );
      debugPrint(dummyDrinks[index].isFavorite.toString());
      emit(ToggleFavoriteAction(productId, dummyDrinks[index].isFavorite));
    }
    else{  product = dummyProducts.firstWhere(
      (product) => product.productId == productId,
    );
    final index = dummyProducts.indexOf(product);
    dummyProducts[index] = dummyProducts[index].copyWith(
      isFavorite: !dummyProducts[index].isFavorite,
    );
    emit(ToggleFavoriteAction(productId, dummyProducts[index].isFavorite));}
  
  }
}
