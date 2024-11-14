// presentation/blocs/product_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:fakestore_clean_architecure/features/shopping/domain/entities/product.dart';
import 'package:fakestore_clean_architecure/features/shopping/domain/repositories/product_repository.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductLoading()) {
    on<FetchProducts>((event, emit) async {
      try {
        final products = await repository.fetchProducts();
        emit(ProductLoaded(products));
      } on Exception catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
