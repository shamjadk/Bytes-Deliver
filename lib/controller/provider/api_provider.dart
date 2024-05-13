import 'dart:developer';

import 'package:bytes_deliver/controller/services/api_service.dart';
import 'package:bytes_deliver/core/objectbox_store.dart';
import 'package:bytes_deliver/core/snack_bar.dart';
import 'package:bytes_deliver/model/api_model/api_model.dart';
import 'package:bytes_deliver/model/cart_entity_model/cart_entity_model.dart';
import 'package:bytes_deliver/objectbox.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_provider.g.dart';

@riverpod
class Api extends _$Api {
  late final Box<CartEntityModel> box;
  @override
  List<CartEntityModel> build() {
    box = CartStore.instance.cartBox;
    return box.getAll();
  }

  Future<List<ApiModel>?> getdata() async {
    return ApiServices.getData();
  }

  Future<void> addToCart(CartEntityModel model) async {
    try {
      if (checkObjectboxExistance(model.title)) {
        showSnackBar('Already added to cart');
      } else {
        box.put(model);
        state = box.getAll();
        showSnackBar('Added to cart');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteItemFromCart(int id) async {
    try {
      box.remove(id);
      state = box.getAll();
      showSnackBar('Removed from cart');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> clearCart() async {
    try {
      box.removeAll();
      state = box.getAll();
      showSnackBar('Cleared cart');
    } catch (e) {
      log(e.toString());
    }
  }

  bool checkObjectboxExistance(String title) {
    Query<CartEntityModel> queries =
        box.query(CartEntityModel_.title.equals(title)).build();

    int resultCount = queries.count();
    return resultCount > 0;
  }
}
