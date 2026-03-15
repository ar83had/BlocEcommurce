part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final ProductDataModel item;
  HomeProductWishlistButtonClickedEvent({required this.item});
}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDataModel item;
  HomeProductCartButtonClickedEvent({required this.item});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent{
  
}

class HomeCartButtonNavigateEvent extends HomeEvent{

}
