import 'package:flutter/material.dart';
import 'package:pratha_app/data/partners.dart';
import 'package:pratha_app/widgets/leading_custom.dart'; // Importing the data.dart file

class PartnersScreen extends StatelessWidget {
  const PartnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 70),
          child: LeadingCustom(title: "Partners"),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.8),
        child: GridView.builder(
          

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            mainAxisSpacing: 8.0, 
            crossAxisSpacing: 8.0, 
            childAspectRatio: 1,
          ),
          itemCount: partner.length, 
          itemBuilder: (context, index) {
            final partnerInfo = partner[index]; 
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.network(
                  partnerInfo.logo,
                  width: 170,
                  height: 170,
                 
                ),
                
              ],
            );
          },
        ),
      ),
    );
  }
}
