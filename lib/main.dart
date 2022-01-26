import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/homepeliculas/provider/movies_provider.dart';
import 'package:pnetflix/paginas/inicio.dart';
import 'package:provider/provider.dart';

import '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppState());
}
class AppState extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false,),
      ],
      child: MyApp(),
      );
  }
}
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InicioPage(),
    );
  }
}