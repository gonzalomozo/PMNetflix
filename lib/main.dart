import 'package:flutter/material.dart';
import 'package:pnetflix/paginas/inicio.dart';

import '';
void main(){  
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InicioPage(),
    );
  }
}