part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}

class HomeProductWishlistActionState extends HomeActionState{
  final String item;
  String msg="No Message yet";

  HomeProductWishlistActionState({required this.item}){
    msg = "$item is added to wishlist";
  }
}

class HomeProductCartActionState extends HomeActionState{

  final String item;
  String msg = "No Message Yet";

  HomeProductCartActionState({required this.item}){
    msg = "$item is added in cart";
  }
}
