import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/homepeliculas/cartel_peliculas.dart';
import 'package:pnetflix/componentes/homepeliculas/model/seriesslider_response.dart';
import 'package:pnetflix/componentes/homepeliculas/models/similarmovies_response.dart';
import 'package:pnetflix/componentes/homepeliculas/peliculas_slider.dart';
import 'package:pnetflix/componentes/homepeliculas/provider/movies_provider.dart';
import 'package:pnetflix/componentes/homepeliculas/widgets/moviessimilare_slider.dart';
import 'package:pnetflix/componentes/homepeliculas/widgets/proximaspelis_slider.dart';
import 'package:pnetflix/componentes/homepeliculas/widgets/series_slider.dart';
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
          ProximasPelisSlider(
              movies: moviesProvider.uncomingMovies,//populares
          title: ('Proximas Peliculas'),
          onNextPage: ()=> moviesProvider.getUncomingMovies(),),
           SimilarPelisSlider(
              movies: moviesProvider.similarMovies,//populares
          title: ('Peliculas Similares'),
          onNextPage: ()=> moviesProvider.getSimilarMovies(),),
          SeriesSlider(
              movies: moviesProvider.seriesPopular,//populares
          title: ('Series'),
          onNextPage: ()=> moviesProvider.getSeriesPopular(),),
            ],
            ),
          
        
      )
    );
  }
}
