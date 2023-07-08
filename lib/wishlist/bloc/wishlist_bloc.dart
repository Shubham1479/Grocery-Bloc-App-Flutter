import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_understanding/Data/wishlist_items.dart';
import 'package:flutter_bloc_understanding/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {

        wishlistItems.remove(event.productDataModel);
        emit(WishlistSuccessState(wishlistItems: wishlistItems));
      }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
  }
}

