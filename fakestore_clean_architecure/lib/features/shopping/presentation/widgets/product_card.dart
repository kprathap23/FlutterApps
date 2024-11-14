import 'package:fakestore_clean_architecure/features/shopping/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product? product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Image section
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Add rounded corners
            child: Image.network(
              product!.image,
              fit: BoxFit.contain,
              height: 100.0, // Adjust image height as needed
            ),
          ),
          // Text section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text left
              children: [
                Text(
                  product!.title,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(
                    height: 8.0), // Add spacing between title and description
                Text(
                  "\$" + product!.price.toString(),
                  style: const TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
