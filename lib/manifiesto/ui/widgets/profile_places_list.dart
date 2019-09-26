import 'package:flutter/material.dart';
import 'package:tysmobile_flutter/providers/orders.dart';
import 'profile_place.dart';


class OrderList extends StatelessWidget {
  
  final OrderItem order;
  final VoidCallback onPressedFabIcon;
 
  OrderList(
   this.order
  ,this.onPressedFabIcon);


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: Column(
        children:  <Widget>[
             ProfilePlace(order: this.order,  onPressedFabIcon: onPressedFabIcon, )
            ]
     ) );
  }

}