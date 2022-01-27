import 'package:flutter/material.dart';
import 'package:pnetflix/componentes/search/search_delegate.dart';

class NavBarPelicula extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  <Widget>[
        Image.asset(
          'assets/1.png',
          width: 30.0,
        ),
        Text(
              'Conoce',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
       Text(
              'Disfruta',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
         IconButton(
      icon: Icon(Icons.search_outlined,color: Colors.white,size: 40),
      onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
      ),
      ],
    );
  }
}