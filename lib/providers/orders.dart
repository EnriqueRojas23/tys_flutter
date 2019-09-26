import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class OrderItem {
  final int idordentrabajo;
  final String numcp;
  final String razonsocial;
  final String estado;
  final String destino;
  final DateTime fechaEntrega;
  String descripcion ;
  int idmaestroetapa ;

  OrderItem({
    @required this.idordentrabajo,
    @required this.numcp,
    @required this.razonsocial,
    @required this.estado,
    @required this.destino,
    @required this.fechaEntrega,
    @required this.idmaestroetapa,
    @required this.descripcion,
  });
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      idordentrabajo: json['idordentrabajo'],
      numcp: json['numcp'],
      razonsocial: json['razonsocial'],
      destino: json['destino'],
      estado: json['estado'],
      fechaEntrega: json['fechaEntrega'],
      idmaestroetapa: json["idmaestroetapa"],
      descripcion: json["descripcion"],
    );
  }
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  OrderItem findById(int id) {
    return _orders.firstWhere((prod) => prod.idordentrabajo == id);
  }
dynamic myEncode(dynamic item) {
  if(item is DateTime) {
    return item.toIso8601String();
  }
  return item;
}

Future uploadImage(File file, int idOrden) async {


  //final url = 'http://104.36.166.65/apitys/api/OrdenTrabajo/UploadFile?idOrden=$idOrden';
  final url = 'http://104.36.166.65/apitys/api/OrdenTrabajo/UploadFile';

   if (file == null) return;


      Dio dio = new Dio();
      FormData formdata = new FormData.fromMap({
            "idOrden": idOrden.toString(),
            "image": await MultipartFile.fromFile(file.path,filename: idOrden.toString() + "_Mobile.jpg"),

      });

      var  response = await dio.post(url, data: formdata);
      


  //  http.post(url, 
  //     headers:{ "Content-Type":"multipart/form-data" } ,
  //    body: {
  //           "photo": base64Image,
  //           "idOrden": idOrden.toString(),

  //  }).then((res) {
  //    print(res.statusCode);
  //  }).catchError((err) {
  //    print(err);
  //  });
 }


 void updateOrder(int id, OrderItem newOrder) {

    final prodIndex = _orders.indexWhere((prod) => prod.idordentrabajo == id);
  
    final url = 'http://104.36.166.65/apitys/api/OrdenTrabajo/ConfirmarEntrega';
    
    String encode = json.encode({
        'idordentrabajo': newOrder.idordentrabajo,
        'idmaestroetapa': newOrder.idmaestroetapa,
        'descripcion': newOrder.descripcion,
        'fechaetapa': DateTime.now().toString(),
        'horaetapa': DateTime.now().hour.toString() +  ":" + DateTime.now().minute.toString() ,
        // 'imageUrl': newOrder.imageUrl,5
        // 'price': newOrder.price,
        // 'isFavorite': newOrder.isFavorite,
      });

    final response =   http
          .post(
      url,
      headers: {"Content-Type": "application/json"},
      body: encode ,
      ).then((onValue){
              if (prodIndex >= 0) {
                _orders[prodIndex] = newOrder;
                notifyListeners();
              } else {
                print('...');
              }
      });
        // if (response.statusCode == 200) {
        
        // }

   
  }
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<OrderItem> fetchAndSetOrders(numcp) async {
   
    final prefs = await SharedPreferences.getInstance();

    final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;

     
     final String _userId  = extractedUserData['userId'];
    


    final url = 'http://104.36.166.65/apitys/api/OrdenTrabajo/BuscarOrden?numcp=$numcp&userid=$_userId';
   
    final response = await http.get(url);
    
      if (response.statusCode == 200) {
          try {
              Map map = jsonDecode(response.body);
              var listOfUsers = OrderItem.fromJson(map);
              _orders.add(listOfUsers);
              notifyListeners();
              return listOfUsers;
      
          } catch (e) {
            return null;
          }
      }
      else if(response.statusCode == 204){
       return null;
    }
    else {
      throw Exception('Failed to load internet');
    }
    
    
 

  }

  // Future<void> addOrder(List<CartItem> cartProducts, double total) async {
  //   final url = '';
  //   final timestamp = DateTime.now();
  //   final response = await http.post(
  //     url,
  //     body: json.encode({
  //       'amount': total,
  //       'dateTime': timestamp.toIso8601String(),
  //       'products': cartProducts
  //           .map((cp) => {
  //                 'id': cp.id,
  //                 'title': cp.title,
  //                 'quantity': cp.quantity,
  //                 'price': cp.price,
  //               })
  //           .toList(),
  //     }),
  //   );
  //   _orders.insert(
  //     0,
  //     OrderItem(
  //       id: json.decode(response.body)['name'],
  //       amount: total,
  //       dateTime: timestamp,
  //       products: cartProducts,
  //     ),
  //   );
  //   notifyListeners();
  // }
}
