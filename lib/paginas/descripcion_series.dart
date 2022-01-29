import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/homepeliculas/model/model.dart';
import 'package:pnetflix/componentes/homepeliculas/models/models.dart';
import 'package:pnetflix/componentes/homepeliculas/widgets/casting_cards.dart';
import 'package:pnetflix/componentes/homepeliculas/widgets/series_cards_actores.dart';


class DescripcionSeries extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     // Todo cambiar luego por una instancia movie
    final Serie serie =
        ModalRoute.of(context)!.settings.arguments as Serie; 
        print(serie.name);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(serie),
          
        SliverList(
          delegate: SliverChildListDelegate([
          _PosterAndTitle(serie),
          _Overview(serie),
           _Overview(serie),
            _Overview(serie),
            SeriesCardsActores(
              serie.id),
          ]
            
          ),)
          
        ],
        
      ),
    );
  }
}
class _CustomAppBar extends StatelessWidget {
  final Serie serie;
  const _CustomAppBar ( this.serie );

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red[900],
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,

          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10,left:10,right: 10),
          color: Colors.black12,
          child: Text(serie.name, style: TextStyle(
            fontSize: 16,
            ),
            textAlign:TextAlign.center,  
            ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/netflix-loading.gif'),
          image: NetworkImage(serie.fullbackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
 
final Serie serie;
  const _PosterAndTitle ( this.serie );

  @override
  Widget build(BuildContext context) {
    
final TextTheme textTheme = Theme.of(context).textTheme;
final size = MediaQuery.of(context).size;
    return Container(
      margin:  EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Hero(
          tag: serie.heroId!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(placeholder: AssetImage('assets/no-image.jpg'), 
            image: NetworkImage(serie.fullPosterImg),
            height: 150,
            width: 110,
           
            ),
          ),
        ),
     SizedBox(width: 20,),

     ConstrainedBox(
       constraints: BoxConstraints(maxWidth: size.width -190),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
     
        Text(serie.name,style: textTheme.headline5, overflow: TextOverflow.ellipsis,maxLines: 2,),
     
         
         Text(serie.originalName,style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),
         Row(
        children: [
        Icon(Icons.star_outline, size: 15,color: Colors.yellow),
        SizedBox(width: 5,),
        Text('${serie.voteAverage}', style: textTheme.caption ,)
         ],)
         
         
         
       ],),
     )
      ],),
    );
  }
}
class _Overview extends StatelessWidget {
  
final Serie serie;
  const _Overview ( this.serie );
  @override
  Widget build(BuildContext context) {
    return Container(
     
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text( serie.overview,
      textAlign: TextAlign.justify,
      style:Theme.of(context).textTheme.subtitle1,
      
      ),
      
      );
      
    
  }
}