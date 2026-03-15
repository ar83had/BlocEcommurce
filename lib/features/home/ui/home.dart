import 'package:counter/features/cart/ui/cart.dart';
import 'package:counter/features/home/bloc/home_bloc.dart';
import 'package:counter/features/home/ui/product_tile_widget.dart';
import 'package:counter/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous,current) => current is HomeActionState,      
      buildWhen: (previous,current) => current is !HomeActionState,
      listener: (context, state) {
        // TODO: implement listener

        if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>cartScreen()));
        }else if(state is HomeNavigateToWishlistPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>WishlistScreen()));
        }else if(state is HomeProductWishlistActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
        }else if(state is HomeProductCartActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
        }
      },
      builder: (context, state) {

        switch(state.runtimeType){
          case HomeLoadingState:
            print("loading");
            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          case HomeLoadedSuccessState:

            final homeLoadedSuccessState  = state as HomeLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text("Grocery"),
                actions: [
                  IconButton(
                    onPressed: (){
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    }, 
                    icon: Icon(Icons.favorite_border)
                  ),
                  IconButton(
                    onPressed: (){
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    }, 
                    icon: Icon(Icons.shopping_bag)
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: homeLoadedSuccessState.products.length,
                itemBuilder: (context,index){
                  return ProductTileWidget(productDataModel: homeLoadedSuccessState.products[index],homeBloc: homeBloc,);
                }
              )
            );
          case HomeErrorState:
            return Scaffold(body: Center(child: Text("Error..."),),);
          default:
            print("default");
            return Scaffold();
        }
      },
    );
  }
}
