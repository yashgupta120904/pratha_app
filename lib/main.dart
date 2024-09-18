import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:pratha_app/screens/home.dart';



void main() {

 


  runApp( DevicePreview(builder: (context) =>ParthaApp()));
}

class ParthaApp extends StatelessWidget {
  const ParthaApp({super.key, });


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        debugShowCheckedModeBanner: false,
        
        theme: ThemeData(
          appBarTheme:  AppBarTheme(
            
          
            titleTextStyle: TextStyle(
              
                fontWeight: FontWeight.bold,
                fontSize: 23,
                fontFamily: 'FontMain',
            
                color: Color.fromARGB(255, 210, 136, 40)),
                
            backgroundColor: Color.fromARGB(255, 210, 193, 136),
            
           

           
            
            
            
          ),
          
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        home:HomeScreen());
  }
}
