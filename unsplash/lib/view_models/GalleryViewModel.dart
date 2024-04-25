import 'package:flutter/material.dart';
import 'package:unsplash/models/ImageModel.dart';

import '../services/ImageService.dart';

class GalleryViewModel extends ChangeNotifier {
  final ImageService _imageService = ImageService();
  List<ImageModel> _images = [];
  List<ImageModel> get images => _images;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _currentPage = 1;

  GalleryViewModel() {
    fetchImages();
  }

  Future<void> fetchImages() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    List<ImageModel> newImages =
        await _imageService.fetchImages(page: _currentPage);
    _images.addAll(newImages);
    _currentPage++;
    _isLoading = false;
    notifyListeners();
  }
}
