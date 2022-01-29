import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/homepeliculas/model/model.dart';



class SeriesSlider extends StatefulWidget {
  
  final List<Serie> movies;
  final String? title;
  final Function onNextPage;

  const SeriesSlider({
    Key? key, 
  required this.movies, 
  required this.onNextPage,
  this.title, 
   
  }) : super(key: key);
  
  @override
  State<SeriesSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<SeriesSlider> {

final ScrollController scrollController = new ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  scrollController.addListener(() {
    
    if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
      //llamar provider
      widget.onNextPage();
    }

  });

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(this.widget.title != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text( this.widget.title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
               itemBuilder: (_, int index) => _MoviePoster(widget.movies[index],'${widget.title}-${widget.movies[index].id}')),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Serie serie;
  final String heroId;
  const _MoviePoster ( this.serie,this.heroId );

  @override
  Widget build(BuildContext context) {
    serie.heroId = heroId;
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10,),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'series',
                arguments: serie),
            child: Hero(
              tag: serie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(serie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            serie.name,style: TextStyle(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}