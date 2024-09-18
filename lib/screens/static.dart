import 'package:flutter/material.dart';
import 'package:pratha_app/data/data.dart';
import 'package:pratha_app/widgets/leading_custom.dart';
class InfoDetailScreen extends StatefulWidget {
  const InfoDetailScreen({super.key, required this.index});
  final int index;

  @override
  State<InfoDetailScreen> createState() => _InfoDetailScreenState();
}

class _InfoDetailScreenState extends State<InfoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final infoSection = info[widget.index];

    return Scaffold(
      appBar: AppBar(
       title: Padding(
          padding: const EdgeInsets.only(right: 70),
          child: LeadingCustom(title: infoSection.title),
        )
      ),
      body: RawScrollbar(
      
        thickness: 7,
        radius: const Radius.circular(10), 
        interactive: true,
        thumbColor: Color.fromARGB(255, 210, 136, 40),
        

  
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: 
                  Text(infoSection.content,
                  textAlign: TextAlign.justify,
                    style: const TextStyle(
                          color: Color.fromARGB(255, 210, 136, 40),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                          )
                    
            ),
          ],
        ),
      ),
    );
  }
}
