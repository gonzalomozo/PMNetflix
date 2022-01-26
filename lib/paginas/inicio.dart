import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/botones.dart';
import 'package:pnetflix/componentes/carte_principal.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           
                Stack(
                children: [
                  SafeArea(child: CartelPrincipal(),),
                  Container(               
                   padding: const EdgeInsets.only(left: 100,right: 70,top:350,),
                   alignment: Alignment.center,
                  child:Center(
                    child: 
                    Text('Series y péliculas └  ilimitadas y      └  mucho más '
                    , style: TextStyle(
                  color: Colors.white,
                  fontSize: 29 ,
                  fontWeight: FontWeight.bold,
                  ),
                   ),
                  
                   ),
                  ),
                
                ],
               ),
               TextoBotones(),
                ],
             
          
        ),
      ),
    );
  }
}
