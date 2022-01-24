import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/botones.dart';
import 'package:pnetflix/componentes/cartel_secundario.dart';
import 'package:pnetflix/componentes/form_Registrou.dart';

class RegistroUsuario extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: 
      Stack(
        children: [
          CartelRegistro(),
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[            
                    Container(                     
                   padding: EdgeInsets.all(8.0),
                      child:  FormRegistroUsuario(),),
                             
                
                ],
             
          
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 525),
          child: TextoRegistro()),
        ],
        
      ),
    );
  }
}