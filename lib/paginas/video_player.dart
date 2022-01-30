import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:pnetflix/componentes/homepeliculas/models/models.dart';
import 'package:pnetflix/componentes/homepeliculas/models/trailer.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class videoplayer extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
        
            final Result result =
        ModalRoute.of(context)!.settings.arguments as Result; 
  
   return Scaffold(
      body: _videoplayerState(result),
    );  
    }
 
}
// ignore: camel_case_types
class _videoplayerState extends StatefulWidget {  
   
   
   final Result result;
   _videoplayerState ( this.result );

  @override
  State<_videoplayerState> createState() => _videoplayerStateState();
}

class _videoplayerStateState extends State<_videoplayerState> {
    
  @override
    final chewieController = ChewieController(
    videoPlayerController: VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    autoInitialize: true,
  );
    // TODO: implement initState


  
  @override
  Widget build(BuildContext context) {
  
      
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.result.name),
      ),
      body: Center(child: Chewie(controller: chewieController) ),
    );
  }
}

