import 'dart:convert';
import 'package:fakestore_clean_architecure/common/Constants.dart';
import 'package:fakestore_clean_architecure/features/shopping/domain/entities/product.dart';
import 'package:fakestore_clean_architecure/features/shopping/domain/repositories/product_repository.dart';
import 'package:http/http.dart' as http;

class FakeStoreRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('${Constants.ApiURL}products'));
    if (response.statusCode == 200) {
      print(response.body);
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
