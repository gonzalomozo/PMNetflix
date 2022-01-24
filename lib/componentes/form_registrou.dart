import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class FormRegistroUsuario extends StatefulWidget {
  
  @override
  _FormRegistroUsuario createState() => _FormRegistroUsuario();
}

class _FormRegistroUsuario extends State<FormRegistroUsuario> {
  
  final ElevatedButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.redAccent[700],
      onPrimary: Colors.white,
     elevation: 10.0,
       padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 15.0),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
       ),
    );
  String email='';
  String password='';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
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
                          'Registrese ahora',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 38.0,
                              color: Colors.white ,
                           
                              fontWeight: FontWeight.bold,
                            ),
                        ),
          ],
        ),           
                         
              SizedBox(height: 10.0,),

              //TextField email
              
      StreamBuilder(
    builder: (BuildContext context,AsyncSnapshot snapshot  ){
  return BounceInDown(
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

          //Contrseñaaaaaaaaaaaaaaaaaa

         StreamBuilder(
    builder: (BuildContext context,AsyncSnapshot snapshot  ){
  return BounceInUp(
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

          //boton para registrarse

          StreamBuilder(
    builder: (BuildContext context,AsyncSnapshot snapshot  ){
  return ElevatedButton.icon(
  
    style: ElevatedButtonStyle, 
    icon: Icon(Icons.person_pin),
          label:Text('Registrar',textAlign: TextAlign.center,style: TextStyle(
        fontSize: 23.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      
      ),
      ),
     
    onPressed: () async {
      try{
        final newUser = 
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
        if(newUser != null){
          showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Mensaje'),
          content: const Text('Se ha registrado correctamente porfavor inicie sesión para disfrutar del contenido'),
          actions: <Widget>[
           
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK',),
              child: const Text('OK',),
              
            ),
          ],
        ),
      );
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


