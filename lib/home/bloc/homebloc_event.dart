part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocEvent {}

class HomeInitialEvent extends HomeblocEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeblocEvent{
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeblocEvent{
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});

}

class HomeWishlistButtonNavigateEvent extends HomeblocEvent{

}

class HomeCartButtonNavigateEvent extends HomeblocEvent{

}