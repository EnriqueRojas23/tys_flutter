import 'package:flutter/material.dart';
import 'package:tysmobile_flutter/Manifiesto/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  String pathImage = "assets/images/paisaje1.jpg";
  String pathImage2 = "assets/images/paisaje2.jpg";
  String pathImage3 = "assets/images/paisaje3.jpg";

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection:  Axis.horizontal,
        children: <Widget>[
          CardImage(pathImage),
          CardImage(pathImage2),
          CardImage(pathImage3),
        ],
      ),
    );
  }

}