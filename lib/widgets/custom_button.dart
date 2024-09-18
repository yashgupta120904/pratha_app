import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;


  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) { 
    return Center(
      child: Container(
          width:150,
    padding: const EdgeInsets.all(5.0),
    height: 150,
    
        
        
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            
           elevation: 7,
           shadowColor:   Colors.orange,
    
            
            padding: const EdgeInsets.all(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color:const  Color.fromARGB(255, 210, 136, 40),size: 30,),
              const SizedBox(height: 3),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color.fromARGB(255, 210, 136, 40),fontSize: 15,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
