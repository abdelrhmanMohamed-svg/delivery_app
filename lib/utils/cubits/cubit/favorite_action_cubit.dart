import 'package:delivery_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_action_state.dart';

class FavoriteActionCubit extends Cubit<FavoriteActionState> {
  FavoriteActionCubit() : super(FavoriteActionInitial());

  void toggleIsFavoriteProduct(String productId) {
    ProductModel product;

    product = dummyProducts.firstWhere(
      (product) => product.productId == productId,
    );
    product = dummyProducts.firstWhere(
      (product) => product.productId == productId,
    );
    final index = dummyProducts.indexOf(product);
    dummyProducts[index] = dummyProducts[index].copyWith(
      isFavorite: !dummyProducts[index].isFavorite,
    );
    emit(ToggleFavoriteAction(productId, dummyProducts[index].isFavorite));
  }
}
