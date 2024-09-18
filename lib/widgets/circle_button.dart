import 'package:flutter/material.dart';


class CircleButton extends StatelessWidget {
  final String text;
  final IconData  icon;


  final VoidCallback onPressed;
  const CircleButton(
      {super.key,
      required this.text,
      required this.icon,
    
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 110,
        height: 110,
        decoration: const BoxDecoration(
         
          shape: BoxShape.circle,
         
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 7,
              shadowColor: Colors.orange
            ),
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                   Icon(icon, color: const Color.fromARGB(255, 210, 136, 40),size: 30,),
          const SizedBox(height: 3),
                
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 210, 136, 40),
                        fontSize: 9,
                        
                        fontWeight: FontWeight.bold),
                  ),
                
              ],
            )),
      ),
    );
  }
}
