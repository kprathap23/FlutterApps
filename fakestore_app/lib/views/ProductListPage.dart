// Product list page
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Product.dart';
import 'CartPage.dart';
import '../view_models/ProductListViewModel.dart';
import '../view_models/ShoppingCartViewModel.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productListViewModel = Provider.of<ProductListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Consumer<ShoppingCartViewModel>(
            builder: (context, cartViewModel, _) {
              final cartItemCount = cartViewModel.getTotalItemsInCart();
              return badge.Badge(
                position: badge.BadgePosition.topEnd(top: 0, end: 0),
                badgeContent: Text(
                  cartItemCount.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: 0.75,
        ),
        itemCount: productListViewModel.products.length,
        itemBuilder: (context, index) {
          final product = productListViewModel.products[index];
          return ProductItem(product: product);
        },
      ),
    );
  }
}

// Product item widget
class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final cartViewModel =
        Provider.of<ShoppingCartViewModel>(context, listen: false);

    return Card(
      elevation: 0.8,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Text(product.title),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Text(
                  '\$${product.price.toString()}',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        cartViewModel.removeItemFromCart(product);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.all(2),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Consumer<ShoppingCartViewModel>(
                      builder: (context, cartViewModel, _) {
                        final itemCount = cartViewModel.cartItems[product] ?? 0;
                        return Text(
                          itemCount.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        );
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        cartViewModel.addItemToCart(product);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
