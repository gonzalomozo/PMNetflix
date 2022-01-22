import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextoBotones extends StatelessWidget {
   
   final ElevatedButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.redAccent[700],
      onPrimary: Colors.white,
      fixedSize: Size(400, 50)
    );
  @override
  Widget build(BuildContext context) {
    return
     Column(
       children: [
         Container(
          padding: const EdgeInsets.only(
            top: 60,
          ),
          alignment: Alignment.center,    
          child: Center(
            child: Text(
              'Disfruta donde quieras',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),            
          ),     
    ),
    
   Container(
          padding: const EdgeInsets.only(
            top: 1,
          ),
          alignment: Alignment.center,    
          child: Center(
            child: Text(
              'Cancela cuando quieras',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.bold,
               
              ),
            ),            
          ),     
    ),
    SizedBox(height: 65.0,),
    ElevatedButton(
           style:ElevatedButtonStyle ,
                  onPressed: () {/*Navigator.push(context, MaterialPageRoute(builder: (context)=>NewAccount()));*/},
                  child: Text(
                    'Comienza ya',textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                     fontFamily: 'LucyRosePERSONAL'
                    ),
                  )),
       ],
     );
    
  }
}
