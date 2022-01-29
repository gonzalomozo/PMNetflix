import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/homepeliculas/models/movie.dart';
import 'package:pnetflix/componentes/nav_bar.dart';

import 'nav_bar_pelicula.dart';

class CartelPeliculas extends StatelessWidget {

    final List<Movie> movies;
  const CartelPeliculas({
    Key? key,
    required this.movies
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(this.movies.length == 0){
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Center(
        child: CircularProgressIndicator()),
    );
  }

    return Column(
      children: <Widget>[
       Stack(
          children: <Widget>[
           FadeInImage(
          placeholder: NetworkImage('https://www.teknofilo.com/wp-content/uploads/2017/10/netflix21-1280x720.jpg'),
          image: NetworkImage( 'https://s10.gifyu.com/images/Mi-video3.gif' ),
          height: 380.0 ,
          fit: BoxFit.cover,
          ),
           Container(
      width: double.infinity,
      height: size.height * 0.5,
     
      child: Swiper(
        itemCount: movies.length ,
      layout: SwiperLayout.STACK,
      itemWidth:  size.width * 0.5,
      itemHeight: size.height * 0.4,
      itemBuilder: ( _ , int index){

       final movie = movies[index];
       movie.heroId = 'swiper-${ movie.id }'; 

      return GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'details',arguments: movie),
      child: Hero(
        tag: movie.heroId!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage( movie.fullPosterImg ),
          fit: BoxFit.cover,
          ),
          ),
      ),
        ) ;
      },
      ),
    ),
           
            
            SafeArea(
              child: NavBarPelicula(),
            ),
          ],
        )
      ],
    );
  }
}