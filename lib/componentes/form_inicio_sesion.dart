import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pnetflix/paginas/page_home_peliculas.dart';

class FormInicioSesionn extends StatefulWidget {
  
  @override
  _FormInicioSesionnState createState() => _FormInicioSesionnState();
}

class _FormInicioSesionnState extends State<FormInicioSesionn> {

String email='';
  String password='';
  final FirebaseAuth _auth = FirebaseAuth.instance;


   final ElevatedButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.redAccent[700],
      onPrimary: Colors.white,
     elevation: 10.0,
       padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 15.0),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
       ),
    );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Icon(
              Icons.account_box,size: 40,color: Colors.white,
            ),
             Text(
                          'Inicie Sesión',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 38.0,
                              color: Colors.white ,
                           
                              fontWeight: FontWeight.bold,
                            ),
                        ),
          ],
        ),           
                 //TextField email       
              SizedBox(height: 10.0,),
      StreamBuilder(
    builder: (BuildContext context,AsyncSnapshot snapshot  ){
  return BounceInRight(
    duration: Duration(seconds: 3),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      
      decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      color: Colors.black45
    ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        initialValue: '',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20  ),
          
        decoration: InputDecoration(
          icon: Icon(Icons.email,color: Colors.white ,),
          hintText: 'ejemplo@correo.com',
          
          hintStyle: TextStyle( 
            color: Colors.white,
            fontSize: 20,
          fontWeight: FontWeight.bold),
          labelText: 'Correo electronico',labelStyle: TextStyle(
            color: Colors.blueAccent[700],
            fontSize: 22,
          fontWeight: FontWeight.bold),
          suffixIcon: Icon(
         Icons.check_circle,color: Colors.white,
       ),
       enabledBorder: UnderlineInputBorder(
         borderSide: BorderSide(color: Colors.white),
       ),
        ),
        
        onChanged: (value1){        
          email =value1; 
        },
      ),
    ),
  );
    }
    ),
          SizedBox(height: 15.0,),
          //contraseña de inicion de sesion
           StreamBuilder(
    builder: (BuildContext context,AsyncSnapshot snapshot  ){
  return BounceInLeft(
    duration: Duration(seconds: 3),
    child: Container(    
     
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      color: Colors.black45
    ),
      child: TextFormField(
        cursorColor: Theme.of(context).canvasColor,
        keyboardType: TextInputType.visiblePassword,
        initialValue: '',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20  ),
          
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock,color: Colors.white,),
          hintText: 'Contraseña',hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          fontWeight: FontWeight.bold),
          suffixIcon: Icon(
         Icons.check_circle,color: Colors.white,
       ),
          labelText: 'Contraseña',labelStyle: TextStyle(
            color: Colors.blueAccent[700],
            fontSize: 22,
          fontWeight: FontWeight.bold),
           enabledBorder: UnderlineInputBorder(
         borderSide: BorderSide(color: Colors.white),
       ),
        ),
        onChanged: (value2){ 
          password= value2;       
        },
      ),
    ),
  );
    }
    ),
          SizedBox(height: 20.0,),
         StreamBuilder(
    builder: (BuildContext context,AsyncSnapshot snapshot  ){
  return ElevatedButton.icon(
  
    style: ElevatedButtonStyle, 
    icon: Icon(Icons.person_pin),
          label:Text('IniciarSesión',textAlign: TextAlign.center,style: TextStyle(
        fontSize: 23.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      
      ),
      ),
      
    onPressed: () async {
      try{
        final newUser = 
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        if(newUser != null){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePagePeliculas()));
        }
      }catch(e){

      }
    }
    );
    }
    ),

    ],);
  }
}

