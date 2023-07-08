part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocState {}

abstract class HomeActionState extends HomeblocState{}

class HomeblocInitial extends HomeblocState {}

class HomeInitial extends HomeblocState{}

class HomeLoadingState extends HomeblocState{}

class HomeLoadedSuccessState extends HomeblocState{
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products
  });
}

class HomeErrorState extends HomeblocState{}

class  HomeNavigateToWishlistPageActionState extends HomeActionState{}

class  HomeNavigateToCartPageActionState extends HomeActionState{}


class HomeProductItemWishlistedActionState extends HomeActionState{}

class HomeProductItemCartedActionState extends HomeActionState{}