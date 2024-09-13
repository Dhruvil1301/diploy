import 'package:diploy/features/shopingScreens/productsList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  final List<MyProduct> cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(cart[index].image),
            title: Text(cart[index].name),
            subtitle: Text('Price: ${cart[index].price}'),
            trailing: Text("Remove",style: GoogleFonts.lato(color:Colors.green),),
          );
        },
      ),
    );
  }
}