import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class BannerScreen1 extends StatefulWidget {
  const BannerScreen1({super.key});

  @override
  State<BannerScreen1> createState() => _BannerScreen1State();
}

class _BannerScreen1State extends State<BannerScreen1> {
  List<String> items = [
    "https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/45d2e8cad38ba5e4.jpg?q=100",
    "https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/5dcc1f2ca3969ab4.png?q=100",
    "https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/f39cd50df3682fa7.jpg?q=100",
    "https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/aa1b2bdcf519b468.jpg?q=100",
    "https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/80e9232048de153f.png?q=100",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coursel Slider"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ExpandableCarousel(
            options:  ExpandableCarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              floatingIndicator: true,
              showIndicator: true,
            ),
            items: items.map((imageURL) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(imageURL, fit: BoxFit.cover));
                },
              );
            }).toList(),
          )
        ],
      )),
    );
  }
}
