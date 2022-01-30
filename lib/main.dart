import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/homepeliculas/models/trailer.dart';

import 'package:pnetflix/paginas/descripcion_pelicula.dart';
import 'package:pnetflix/componentes/homepeliculas/provider/movies_provider.dart';
import 'package:pnetflix/paginas/descripcion_series.dart';
import 'package:pnetflix/paginas/inicio.dart';
import 'package:pnetflix/paginas/page_home_peliculas.dart';
import 'package:pnetflix/paginas/trailerpeliculas.dart';
import 'package:pnetflix/paginas/video_player.dart';
import 'package:pnetflix/screensy/video_screen.dart';
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

     final Result result; 
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      
      initialRoute: 'home',
      routes:{
        'home':( _ )=> InicioPage(),
        'details':( _ )=> DescripcionPelicula(),
        'series':( _ )=> DescripcionSeries(),
        // ignore: prefer_const_constructors
        'video':( _ )=> VideoScreen(id:'C9Z75wfjxCU'),
        },
    );
  }
}