import 'package:flutter/material.dart';

import 'package:tysmobile_flutter/providers/orders.dart';
import 'package:tysmobile_flutter/screens/entrega_orden_screen.dart';
import 'package:tysmobile_flutter/widgets/button_purple.dart';

import 'package:toast/toast.dart';

class ProfilePlace extends StatefulWidget {

    final  OrderItem order ; 
   final VoidCallback onPressedFabIcon;

   ProfilePlace({  Key key,
     @required this.order,
      @required this.onPressedFabIcon}) ;

  _ProfilePlaceState createState() => _ProfilePlaceState(order: this.order,  onPressedFabIcon: onPressedFabIcon,);
}


class _ProfilePlaceState extends State<ProfilePlace>  {

   OrderItem order ; 
   final VoidCallback onPressedFabIcon;

  _ProfilePlaceState({
     Key key,
     @required this.order,
      @required this.onPressedFabIcon });



  @override
  Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;


    final place = Text(
      this.order?.numcp?? '',
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
    );
   
   
    final placeInfo = Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.0
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                 this.order?.destino?? '',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                  this.order?.estado?? '',
                style: TextStyle(
                    color: Colors.amber,
                    fontFamily: 'Lato',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                ),
              )
            ]
        )
    );

      final steps = Text(
       '' ,//' ${this.order?.razonsocial?? ''}',
      style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.amber
      ),
    );

     final card = Container(
      width: screenWidth * 0.75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              place,
              placeInfo,
              steps
            ],
          )
      ),
    );

    final photoCard = Container(
      margin: EdgeInsets.only(
          top: 30.0,
          bottom: 30.0
      ),
      height: 220.0,
      decoration: BoxDecoration(
           
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(""),
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
    );

    return Stack(
      alignment: Alignment(0.0, 0.8),
      children: <Widget>[
        photoCard,
        Stack(
          alignment: Alignment(0.8, 1.95),
          children: <Widget>[
            card,
           ButtonPurple(
           buttonText: "Confirmar Entrega",
                    onPressed: () {
                      
                      if(this.order.estado == "Pend Entrega") {
                         Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EntregaOrdenScreen(),
                        settings: RouteSettings(arguments: this.order.idordentrabajo)),
                      ).then((onValue){
                           setState(() {
                                  this.order = onValue;
                                 Toast.show("La orden fue entregada con exito.", context, duration: 2, gravity: Toast.CENTER);
                            });
                      });
                      }
                      else {
                         Toast.show("Esta orden ya fue entregada", context, duration: 2, gravity: Toast.CENTER);
                      }
                      
                    }),
         
          ],
        )
      ],
    );
  }

}
