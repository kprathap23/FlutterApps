import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../view_models/GalleryViewModel.dart';
import '../widgets/GalleryItem.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.position.pixels;
    final double delta = 200.0; // arbitrary value to trigger loading
    if (maxScroll - currentScroll <= delta) {
      Provider.of<GalleryViewModel>(context, listen: false).fetchImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Consumer<GalleryViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.images.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return StaggeredGridView.countBuilder(
              controller: _scrollController,
              crossAxisCount: 2,
              itemCount:
                  viewModel.images.length + 1, // +1 for loading indicator
              itemBuilder: (context, index) {
                if (index < viewModel.images.length) {
                  return GalleryItem(
                      imageUrl: viewModel.images[index].imageUrl);
                } else {
                  if (viewModel.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox.shrink(); // Hides the loader if not loading
                  }
                }
              },
              staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
          }
        },
      ),
    );
  }
}
