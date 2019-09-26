import 'package:flutter/material.dart';
import 'package:tysmobile_flutter/providers/orders.dart';
import 'package:tysmobile_flutter/screens/entrega_orden_screen.dart';
import 'package:tysmobile_flutter/widgets/button_purple.dart';
import 'package:tysmobile_flutter/widgets/order_item.dart';
import 'package:tysmobile_flutter/widgets/order_item.dart' as prefix0;

class DescriptionPlace extends StatelessWidget{

  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);


  @override
  Widget build(BuildContext context) {


    final star_half = Container (
      margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star_half,
        color:  Color(0xFFf2C611),
      ),
    );

    final star_border = Container (
      margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star_border,
        color:  Color(0xFFf2C611),
      ),
    );

    final stars = Container(
      margin:  EdgeInsets.only(
        top: 323.0,
        right: 3.0,

      ),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );

    final title_stars = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),
          child: Text(
            this.namePlace
          , style: TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),

        ),
        Row(
          children: <Widget>[
            stars,
            stars,
            stars,
            stars,
            star_half

          ],
        )

      ],
    );



    final description = Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: new Text(
        descriptionPlace,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),

      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title_stars,
        description,
        ButtonPurple(
           buttonText: "Confirmar Entrega",
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EntregaOrdenScreen(),
                        
                        settings: RouteSettings(
                          arguments: 123
                             )
                        ),
                      );
                    }),
      ],
    );
  }

}