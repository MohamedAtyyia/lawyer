import 'package:flutter/material.dart';

class HeroNetworkImage extends StatelessWidget {
  HeroNetworkImage({super.key, required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image);
  }
}
