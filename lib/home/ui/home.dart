import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_understanding/cart/ui/cart.dart';
import 'package:flutter_bloc_understanding/home/bloc/homebloc_bloc.dart';
import 'package:flutter_bloc_understanding/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_understanding/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    homeblocBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeblocBloc homeblocBloc = HomeblocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      bloc: homeblocBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const WishlistPage()));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to Cart!')));
        }else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to Wishlist!')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
             return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
                ));
          
          case HomeLoadedSuccessState:
          final successState = state as HomeLoadedSuccessState;
            return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Center(child: Text('Grocery By Bloc!')),
            actions: [
              IconButton(
                  onPressed: () {
                    homeblocBloc.add(HomeWishlistButtonNavigateEvent());
                  },
                  icon: const Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeblocBloc.add(HomeCartButtonNavigateEvent());
                  },
                  icon: const Icon(Icons.shopping_bag_outlined)),
            ],
          ),
          body: ListView.builder(
            itemCount: successState.products.length,
            itemBuilder: (context,index){
            return ProductTileWidget(
              homeblocBloc: homeblocBloc,
              productDataModel: successState.products[index]);
          }),
        );


          case HomeErrorState:
          return const Scaffold(body: Center(child: Text("Error!"),),);
          default:
          return const SizedBox();
        }
      },
    );
  }
}
