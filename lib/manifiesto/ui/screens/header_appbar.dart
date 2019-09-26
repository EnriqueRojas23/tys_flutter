import 'package:flutter/material.dart';

import '../widgets/card_image_list.dart';
import 'package:tysmobile_flutter/widgets/gradient_back.dart';

class HeaderAppBar  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack(height: 300.0,),
        CardImageList()
      ],
    );
  }

}