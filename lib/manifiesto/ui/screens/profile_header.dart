import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tysmobile_flutter/manifiesto/model/user.dart';
import 'package:tysmobile_flutter/manifiesto/ui/widgets/user_info.dart';
import 'package:tysmobile_flutter/manifiesto/ui/widgets/button_bar.dart';
import 'package:tysmobile_flutter/providers/auth.dart';

class ProfileHeader extends StatelessWidget {

  
  User user;
  @override
  Widget build(BuildContext context) {
      return showProfileData(context);
  }

  Widget showProfileData(BuildContext context){
    var name =  Provider.of<Auth>(context, listen: false);
    user = User(name: name.userId, email: "enrique.rojas@riabc.net", photoURL: "https://www.google.com/a/cpanel/riabc.net/images/logo.gif?service=google_gsuite");

    final title = Text(
      'Profile',
      style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0
      ),
    );

      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title
              ],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );
    }
  

}