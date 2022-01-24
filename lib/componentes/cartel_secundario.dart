import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/nav_bar.dart';

import 'navbar_secundario.dart';

class CartelSecundario extends StatelessWidget {
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
              'https://i0.wp.com/hipertextual.com/wp-content/uploads/2019/11/hipertextual-si-te-vas-netflix-no-olvides-descargar-mi-actividad-mi-lista-2019814675.jpg?fit=1500%2C1000&ssl=1',
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
              child: NavBarSuperiorS(),
            ),
          ],
        );
  }
}

class CartelRegistro extends StatelessWidget {
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
              'https://www.teknofilo.com/wp-content/uploads/2021/06/Netflix.jpg',
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
              child: NavBarRegistro(),
            ),
          ],
        );
  }
}

