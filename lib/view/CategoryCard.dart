import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/Category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final double imgWidth;
  final double imgHeight;

  CategoryCard(this.category, {this.imgWidth = 150, this.imgHeight = 130});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xfff5f4f4),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
      child: Column(children: [
        CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(), //,
          imageUrl: category.imgURL,
          width: imgWidth,
          height: imgHeight,
        ),
        Text(
          category.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ]),
      //color: Colors.teal[100],
    );
  }
}
