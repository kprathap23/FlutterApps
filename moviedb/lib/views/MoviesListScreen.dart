import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/models/Movie.dart';
import 'package:themoviedb/view_models/MoviesListViewModel.dart';

class MoviesListScreen extends StatelessWidget {
  final MoviesListViewModel viewModel;

  const MoviesListScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Movie>>(
        future: viewModel.fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.5,
                  mainAxisSpacing: 0.5,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final movie = snapshot.data![index];
                  return GridTile(
                    footer: GridTileBar(
                      backgroundColor: Colors.black38,
                      title: Text(
                        movie.title!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w300${movie.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
