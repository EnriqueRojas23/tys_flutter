import 'package:flutter/material.dart';
import 'package:tysmobile_flutter/manifiesto/ui/widgets/circle_button.dart';



class SearchHeader extends  StatelessWidget {

  final _ordenController = TextEditingController();
  final Function search;


 SearchHeader(this.search);

  
  @override
  Widget build(BuildContext context) {
    return showSearch(context);
  }


   Widget showSearch(BuildContext context){
    
    

    final title = Text(
      'Búsqueda de Orden',
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
            top: 100.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title,
                Padding(
                  padding: EdgeInsets.symmetric(
                     horizontal: 0.0,
                      vertical: 40.0
                  ),
                )
              ],
            ),
            TextFormField(
              controller: _ordenController,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: '100-'
              ),
              maxLines: 1,
              keyboardType: TextInputType.number,
              style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0
               ),
            ),
            //UserInfo(user),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.0,
                    vertical: 10.0
                ),
                child: Row(
                children: <Widget>[
                  // CircleButton(true, Icons.turned_in_not, 20.0, Color.fromRGBO(255, 255, 255, 1)
                  //     , ()=> {

                  //     }),
                  // CircleButton(true, Icons.add, 20.0, Color.fromRGBO(255, 255, 255, 0.6)             , ()=> {

                  // }),
                  CircleButton(false, Icons.search, 40.0, Color.fromRGBO(255, 255, 255, 1)             , ()=> {
                              search(_ordenController.text)
                             


                  }),
                ],
              )
            )
          ],
        ),
      );
    }
}
