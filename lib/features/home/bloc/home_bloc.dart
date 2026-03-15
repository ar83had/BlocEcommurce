import 'dart:async';
// import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:counter/data/grocery_data.dart';
import 'package:counter/features/home/model/home_product.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeInitialEvent>(homeInitialEvent);
  }
  
  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProduct.map((el)=>ProductDataModel(id: el["id"], description: el["description"], name: el["name"], price: el["price"], imageUrl: el["imageUrl"])).toList()));
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Navigate to cart...");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Naviate to wish List...");
    emit(HomeNavigateToWishlistPageActionState());
  }

}
