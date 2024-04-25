import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/ImageModel.dart';

class ImageService {
  final String _baseUrl = 'https://api.unsplash.com/photos/';
  final String _apiKey = 'oMqx0BzXld_BuEBI70OyXgyQ_sDrZo-hE3JtzsAsrNg';

  Future<List<ImageModel>> fetchImages({int page = 1}) async {
    await Future.delayed(Duration(seconds: 1));

    final response =
        await http.get(Uri.parse('$_baseUrl?page=$page&client_id=$_apiKey'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<ImageModel> images = data
          .map((item) => ImageModel(imageUrl: item['urls']['regular']))
          .toList();
      return images;
    } else {
      throw Exception('Failed to load images');
    }
  }
}
