import 'package:flutter/material.dart';
import 'package:tysmobile_flutter/manifiesto/ui/screens/profile_header.dart';
import 'package:tysmobile_flutter/manifiesto/ui/widgets/profile_background.dart';
import 'package:tysmobile_flutter/manifiesto/ui/widgets/profile_places_list.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
           // OrderList("100-12312")
          ],
        ),
      ],
    );
  }

}