import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {


  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
 late ChewieController chewieController; 
 
  @override
  void initState() {
    // Crear y almacenar el VideoPlayerController. El VideoPlayerController
    // ofrece distintos constructores diferentes para reproducir videos desde assets, archivos,
    // o internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Inicializa el controlador y almacena el Future para utilizarlo luego
    _initializeVideoPlayerFuture = _controller.initialize();
     

    // Usa el controlador para hacer un bucle en el vídeo
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Asegúrate de despachar el VideoPlayerController para liberar los recursos
    _controller.dispose();

    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Butterfly Video'),
      ),
      // Usa un FutureBuilder para visualizar un spinner de carga mientras espera a que
      // la inicialización de VideoPlayerController finalice.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Si el VideoPlayerController ha finalizado la inicialización, usa
            // los datos que proporciona para limitar la relación de aspecto del VideoPlayer
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Usa el Widget VideoPlayer para mostrar el vídeo
              child: VideoPlayer(_controller),
            );
          } else {
            // Si el VideoPlayerController todavía se está inicializando, muestra un
            // spinner de carga
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Envuelve la reproducción o pausa en una llamada a `setState`. Esto asegura 
          // que se muestra el icono correcto
          setState(() {
            // Si el vídeo se está reproduciendo, pausalo.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // Si el vídeo está pausado, reprodúcelo
              _controller.play();
            }
          });
        },
        // Muestra el icono correcto dependiendo del estado del vídeo.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), // Esta coma final hace que el formateo automático sea mejor para los métodos de compilación.
    );
  }
}