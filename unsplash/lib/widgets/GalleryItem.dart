import 'package:flutter/material.dart';

import '../views/ImageDetailScreen.dart';

class GalleryItem extends StatelessWidget {
  final String imageUrl;

  GalleryItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ImageDetailScreen(imageUrl: imageUrl)),
        );
      },
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
