import 'package:flutter/material.dart';
import 'package:tysmobile_flutter/Manifiesto/ui/widgets/review_list.dart';
import 'package:tysmobile_flutter/Manifiesto/ui/widgets/descripcion_place.dart';
import 'package:tysmobile_flutter/Manifiesto/ui/screens/header_appbar.dart';


class HomeManifiesto extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace("Manifiestos",2,""),
            ReviewList(),
          ],
        ),
        HeaderAppBar()
      ],
    );
   }
  }