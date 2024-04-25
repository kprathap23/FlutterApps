import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/screens/NewsDetailScreen.dart';

import '../models/NewsApiDataResponse.dart';

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  List<Article> _articles = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    const String apiUrl =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=60e9bee377fe41c5bfb2b6909fe004c8';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        NewsApiDataResponse newsApiDataResponse =
            newsApiDataResponseFromJson(response.body);

        _articles = newsApiDataResponse.articles!;
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: _articles.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailScreen(
                              url: _articles[index].url!,
                            ),
                          ));
                    },
                    child: newsCard(index));
              },
            ),
    );
  }

  Widget newsCard(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: CachedNetworkImage(
                imageUrl: _articles[index].urlToImage!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      // colorFilter:ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
              child: Text(
                _articles[index].title!,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.9)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
              child: Text(
                _articles[index].author!,
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
