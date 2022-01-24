import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/botones.dart';
import 'package:pnetflix/componentes/cartel_secundario.dart';
import 'package:pnetflix/componentes/form_inicio_sesion.dart';

class InicioSesion extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.black,
      body: 
      Stack(
        children: [
          CartelSecundario(),
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[            
                    Container(                     
                   padding: EdgeInsets.all(8.0),
                      child:  FormInicioSesionn(), ),
                             
                
                ],
             
          
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 525),
          child: TextoInicioSesion()),
        ],
        
      ),
    );
  }
}
