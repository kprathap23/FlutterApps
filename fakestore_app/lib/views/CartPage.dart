import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/ShoppingCartViewModel.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<ShoppingCartViewModel>(context);
    final cartItems = cartViewModel.cartItems;

    // Calculate total amount
    double totalAmount = 0;
    cartItems.forEach((product, quantity) {
      totalAmount += product.price * quantity;
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final product = cartItems.keys.elementAt(index);
            final quantity = cartItems[product]!;
            return ListTile(
              leading: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
              title: Text(product.title),
              subtitle: Text('Quantity: $quantity'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  cartViewModel.deleteItemFromCart(product);
                },
              ),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              children: [
                Text(
                  'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Implement checkout functionality
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ));
  }
}
