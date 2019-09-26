
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tysmobile_flutter/providers/orders.dart';
import 'package:tysmobile_flutter/widgets/button_purple.dart';
import 'package:tysmobile_flutter/widgets/floating_action_button_green.dart';
import 'package:tysmobile_flutter/widgets/gradient_back.dart';
import 'package:tysmobile_flutter/widgets/title_header.dart';
import 'package:tysmobile_flutter/widgets/title_input_location.dart';


class EntregaOrdenScreen extends StatefulWidget {
  EntregaOrdenScreen({Key key});
  @override
  EntregaOrdenScreenState createState() {
    return new EntregaOrdenScreenState();
  }
}

class EntregaOrdenScreenState extends State<EntregaOrdenScreen> {
File image;

final _form = GlobalKey<FormState>();


final _priceFocusNode = FocusNode();
final _descriptionFocusNode = FocusNode();
final _imageUrlController = TextEditingController();
final _imageUrlFocusNode = FocusNode();

final _controllerTitlePlace = TextEditingController();
final _controllerDescriptionPlace = TextEditingController();


List _cities =
  ["Entrega conforme (OK)", "Dirección no existe", "Local cerrado", "Rechazo", "Otros"];

  var _initValues = {
      'numcp': "",
      'razonsocial': "",
      'destino': "",
      'imageUrl': '',
  };
  String _currentCity;
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  var _editedProduct = OrderItem(
    idordentrabajo: null,
    numcp: '',
    estado: null,
    destino: '',
    fechaEntrega: null,
    razonsocial: '',
    descripcion: '',
    idmaestroetapa: null
  );

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = getDropDownMenuItems();
     //_currentCity = _dropDownMenuItems[].value;
  }
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final ordenId = ModalRoute.of(context).settings.arguments as int;
//      final DescriptionPlace args = ModalRoute.of(context).settings.arguments ;

      

      if (ordenId != null) {
        _editedProduct =
            Provider.of<Orders>(context, listen: false).findById(ordenId);
        _initValues = {
          'numcp': _editedProduct.numcp,
          'razonsocial': _editedProduct.razonsocial,
          'destino': _editedProduct.destino,
          // 'imageUrl': _editedProduct.imageUrl,
          'imageUrl': '',
        };
       // _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
   
    _isInit = false;
    super.didChangeDependencies();
  }
  var _isInit = true;
  var _isLoading = false;

    List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }
  void changedDropDownItem(String selectedCity) {
    print("Selected city $selectedCity, we are going to refresh the UI");
    setState(() {
      
      _currentCity = selectedCity;
      if(_currentCity == "Entrega conforme (OK)")
      {
          _editedProduct.idmaestroetapa = 5;
      }


    });
  }
 @override
  void dispose() {
//    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }


 

  picker() async {
    print('Picker is called');
    File img = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 25);

    if (img != null) {
      image = img;
      setState(() {});
    }
  }



  @override
  Widget build(BuildContext context) {

     
     return    Scaffold(
      
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          :  Stack(
        children: <Widget>[
          GradientBack(height: 300.0,),
          Row( //App Bar
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45,),
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  ),
                ),
              ),

              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                  child: TitleHeader(title: "Confirmar Entrega"),
              ))


            ],
          ),        
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom:20.0),
            child: Form(
              key: _form, 
              child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                        alignment: Alignment(0.9,1.1),
                        children: <Widget>[
                          
                         
                          
                          Container(
                                height: 250.0,
                                width: 350.0,
                                margin: EdgeInsets.only(
                                  left: 0

                                ),
                                child: new Center(
                                        
                                        child: image == null
                                            ? new Text('Foto de entrega')
                                            :  new FittedBox (
                                               fit: BoxFit.cover,
                                                alignment: Alignment.center, 
                                                child: new Image.file(File(image.path))),
                                      ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  shape: BoxShape.rectangle,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow (
                                      color:  Colors.black38,
                                      blurRadius: 15.0,
                                      offset: Offset(0.0, 7.0)
                                    )
                                  ]

                                ),
                              ),    
                          FloatingActionButtonGreen(iconData: Icons.camera
                          , onPressed: picker
                          , herotag: "btn3")
                        ],
                      ),
                  
                  
                  
                  // CardImageWithFabIcon(
                  //   pathImage: "assets/img/sunset.jpeg",
                  //   iconData: Icons.camera,
                  //   width: 350.0,
                  //   height: 250.0,
                  //   left: 0,
                  //   onPressedFabIcon: picker,
                    
                  //   //() {

                  //       // ImagePicker.pickImage(
                  //       //      source: ImageSource.camera
                  //       //    ).then((File image) {
                  //       //        setState(() {});
                  //       //    })
                  //       //    .catchError((onError) => print(onError));

                  //  // },
                  // ),
                ),  Container( 
                    margin: EdgeInsets.only(top:20.0, bottom: 20.0, left: 20.0, right: 20.0),
                    child:  new Column(
                      children: <Widget>[
                        new ListTile(
                          leading: const Icon(Icons.train),
                          title:  Text( _initValues["numcp"],
                                    style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: "Lato",
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold
                              ),
                          ),
                        ),
                        new ListTile(
                          leading: const Icon(Icons.transit_enterexit),
                          title:  Text( _initValues["razonsocial"],
                                    style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: "Lato",
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold
                              ),
                          ),
                        ),
                      ],
                    )
                   ),
                  Container(
                  margin: EdgeInsets.only(top:20.0, bottom: 20.0, left: 20.0, right: 20.0),
                  child:  new DropdownButtonFormField(
                        decoration: InputDecoration(
                                  
                                  border: UnderlineInputBorder(
                                      borderSide:
                     BorderSide(color: Colors.white))),
              
                      hint: new Text("Seleccionar tipo de entrega..",
                      textAlign: TextAlign.center),
                      value: _currentCity,
                      items: _dropDownMenuItems,
                      onChanged: changedDropDownItem,
                      // underline: Container(
                      //             height: 2,
                      //             color: Colors.deepPurpleAccent,
                      //           ),
                      validator: (value) {
                        if (value == null) {
                          return 'Seleccione un tipo de entrega';
                        }
                        if (value.length < 10) {
                          return 'La observación no debe contener menos de 10 caracteres.';
                        }
                        return null;
                        
                      },
                    ),
                ),
                   Container (
                padding: EdgeInsets.only(right: 20.0, left: 20.0),
                 child:  TextFormField(//Description
                        style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: "Lato",
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold
                            ),
                                  decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFe5e5e5),
                          border: InputBorder.none,
                          hintText: "Ingrese alguna observación en la entrega.",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                            borderRadius: BorderRadius.all(Radius.circular(9.0))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                              borderRadius: BorderRadius.all(Radius.circular(9.0))
                          )

                        ),
                      controller: _controllerDescriptionPlace,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor ingresar una observación.';
                        }
                        if (value.length < 10) {
                          return 'La observacicón no debe contener menos de 10 caracteres.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                       _editedProduct = OrderItem(
                            idordentrabajo: _editedProduct.idordentrabajo,
                            numcp: _editedProduct.numcp,
                            destino: _editedProduct.destino,
                            fechaEntrega: _editedProduct.fechaEntrega,
                            estado : _editedProduct.estado,
                            razonsocial:   _editedProduct.razonsocial,
                            descripcion: _editedProduct.descripcion ,
                            idmaestroetapa: _editedProduct.idmaestroetapa); 
                                               },
                    ),
                   ),





                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Agregar ubicación",
                    iconData: Icons.location_on, controller: null,),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Confirmar Entrega",
                    onPressed:_saveForm,
                  ),
                )
              ],
              ),
            ),
          ),


        ])
    );
  }
  




   void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedProduct.idordentrabajo != null) {

      Provider.of<Orders>(context, listen: false)
          .updateOrder(_editedProduct.idordentrabajo, _editedProduct);

      setState(() {
      
       Provider.of<Orders>(context, listen: false)
          .uploadImage( image ,  _editedProduct.idordentrabajo );


        _isLoading = false;
         Navigator.of(context).pop();
      });
    
    } 
  }
}
