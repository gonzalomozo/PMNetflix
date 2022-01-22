import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/botones.dart';
import 'package:pnetflix/componentes/cartel_secundario.dart';


class InicioSesion extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[        
              CartelSecundario(),              
              
              ],
           
        
      ),
    );
  }
}