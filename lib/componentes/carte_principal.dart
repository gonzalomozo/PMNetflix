import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/nav_bar.dart';

class CartelPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      this.cabecera(),
      ],
    );
  }
  Widget cabecera(){
      return Stack(
          children: <Widget>[
            Image.network(
              'https://www.teknofilo.com/wp-content/uploads/2017/10/netflix21-1280x720.jpg',
              height: 380.0,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: 390.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter ,
                colors: <Color>[
                  Colors.black12,
                  Colors.black,

                ]
                ),
              ),
            ),
            SafeArea(
              child: NavBarSuperior(),
            ),
          ],
        );
  }
}
