import 'package:counter/features/home/bloc/home_bloc.dart';
import 'package:counter/features/home/model/home_product.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {

  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl)
              )
            ),
          ),
          SizedBox(height: 10,),
          Text(productDataModel.name,style: TextStyle(fontWeight: FontWeight.bold),),
          Text(productDataModel.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ "+productDataModel.price.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      homeBloc.add(HomeProductWishlistButtonClickedEvent(item: productDataModel));
                    }, 
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: (){
                      homeBloc.add(HomeProductCartButtonClickedEvent(item:productDataModel));
                    }, 
                    icon: Icon(Icons.shopping_bag),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}