// presentation/pages/product_page.dart
// ignore_for_file: use_key_in_widget_constructors

import 'package:fakestore_clean_architecure/features/shopping/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/products_repository.dart';
import '../blocs/product_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductBloc _productBloc = ProductBloc(FakeStoreRepository());

  @override
  void initState() {
    super.initState();
    _productBloc.add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: BlocProvider(
          create: (context) => _productBloc,
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductLoaded) {
                double width = MediaQuery.of(context).size.width;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width < 480 ? 2 : 4,
                    // Change this to adjust the number of columns
                    mainAxisSpacing: 5.0, // Adjust spacing between grid items
                    crossAxisSpacing: 5.0, // Adjust spacing between grid items
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ProductCard(product: product);
                  },
                );
              } else if (state is ProductError) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          ),
        ));
  }
}
