import 'package:flutter/material.dart';


class User {
  //final String uid;
  final String name ;
  final String email ;
  final String photoURL;
  //final List<Manifiesto> myPlaces;

  User({
    Key key,
    @required this.name,
    @required this.email,
    @required this.photoURL,
});


}