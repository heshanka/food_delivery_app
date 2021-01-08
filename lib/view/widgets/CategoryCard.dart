import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Utils.dart';
import '../../model/Category.dart';
import '../screens/Products.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final double imgWidth;
  final double imgHeight;

  CategoryCard(this.category, {this.imgWidth = 150, this.imgHeight = 130});

  @override
  Widget build(BuildContext context) {
    double scaleFactor = Utils.getScreenWidth(context) / Utils.pWidth;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Products(
              catId: category.id,
              catName: category.name,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8 * scaleFactor),
        decoration: BoxDecoration(
            color: Color(0xfff6f6f6),
            border: Border.all(width: 0.2, color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CachedNetworkImage(
              placeholder: (context, url) => Container(
                    child: Image.asset(
                      "assets/edited.gif",
                    ),
                  ), //,
              imageUrl: category.imgURL,
              height: imgHeight * scaleFactor),
          Text(
            category.name,
            style: GoogleFonts.redressed(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            textScaleFactor: scaleFactor,
          ),
        ]),
        //color: Colors.teal[100],
      ),
    );
  }
}
