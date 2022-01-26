import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/homepeliculas/cartel_peliculas.dart';
import 'package:pnetflix/componentes/homepeliculas/peliculas_slider.dart';
import 'package:pnetflix/componentes/homepeliculas/provider/movies_provider.dart';
import 'package:provider/provider.dart';
class HomePagePeliculas extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            CartelPeliculas(movies: moviesProvider.onDisplayMovies,),
            PeliculasSlider(
              movies: moviesProvider.popularMovies,//populares
          title: ('Populares'),
          onNextPage: ()=> moviesProvider.getPopularMovies(),),
            ],
            ),
          
        
      )
    );
  }
}