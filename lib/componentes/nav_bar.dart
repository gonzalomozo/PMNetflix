import 'package:flutter/material.dart';
import 'package:pnetflix/paginas/inicio_sesion.dart';
import 'package:pnetflix/paginas/registro_usuario.dart';

class NavBarSuperior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ElevatedButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.transparent,
      onPrimary: Colors.white,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset(
          'assets/1.png',
          width: 30.0,
        ),
        ElevatedButton(
          style:ElevatedButtonStyle ,
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>InicioSesion()));},
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  )),
       ElevatedButton(
          style:ElevatedButtonStyle ,
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>FormRegistroUsuario()));},
                  child: Text(
                    'Registrese ahora',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  )),
       
      ],
    );
  }
}
