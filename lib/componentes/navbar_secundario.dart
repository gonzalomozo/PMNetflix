import 'package:flutter/material.dart';
import 'package:pnetflix/paginas/inicio.dart';
import 'package:pnetflix/paginas/inicio_sesion.dart';
import 'package:pnetflix/paginas/registro_usuario.dart';

class NavBarSuperiorS extends StatelessWidget {
  
    
  @override
  Widget build(BuildContext context) {
    final ElevatedButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.transparent,
      onPrimary: Colors.white,
     
    );
    
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  <Widget>[
        Image.asset(
            'assets/1.png',
            width: 30.0,
            
          ),
        
       Text(
              'Privacidad',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
        ElevatedButton(
            style: ElevatedButtonStyle,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistroUsuario()));
            },
            child: Text(
              'Registrese Aquí',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
            ),
      ],
    );
  }
}

class NavBarRegistro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ElevatedButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.transparent,
      onPrimary: Colors.white,
    );
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  <Widget>[
        Image.asset(
          'assets/1.png',
          width: 30.0,
        ),
       Text(
              'Privacidad',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
        ElevatedButton(
            style: ElevatedButtonStyle,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>InicioSesion()));
            },
            child: Text(
              'Iniciar sesion',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
            ),
      ],
    );
  }
}