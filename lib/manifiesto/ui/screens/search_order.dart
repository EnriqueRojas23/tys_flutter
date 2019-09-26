import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:tysmobile_flutter/manifiesto/ui/screens/search_header.dart';
import 'package:tysmobile_flutter/manifiesto/ui/widgets/profile_background.dart';
import 'package:tysmobile_flutter/manifiesto/ui/widgets/profile_places_list.dart';
import 'package:tysmobile_flutter/providers/orders.dart';
import 'package:tysmobile_flutter/screens/entrega_orden_screen.dart';

class SearchOrden extends StatefulWidget {
  SearchOrden({Key key}) : super(key: key);
  _SearchOrdenState createState() => _SearchOrdenState();
}

class _SearchOrdenState extends State<SearchOrden> {
  OrderItem _order ;
  var _isLoading = false;
  picker() async {
      Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => EntregaOrdenScreen(),
             settings: RouteSettings(arguments: 4295)),
       ).then((onValue) {
            setState(() {
                           
             });
       });
  }

  void search(String txOrden) {
      setState(() {
                            _isLoading = true;
      });
       Future.delayed(Duration.zero).then((_) {
        
          Provider.of<Orders>(context, listen: false).fetchAndSetOrders(txOrden).then((onValue){
                    setState(() {
                           _order = onValue;
                           if(onValue == null){
                              Toast.show("No existe la orden", context, duration: 2, gravity: Toast.CENTER);
                           }
                          
                    }); 
                     _isLoading = false;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
     return 
     Scaffold (
       body : _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            ) :  Stack(
      children:  <Widget>[
        ProfileBackground(),
        ListView(
          children:  <Widget>[
            SearchHeader(search),
            _order == null ? Text("") : OrderList(_order,picker)
          ],
        ),
      ],
      )
    ); 
  }
}




