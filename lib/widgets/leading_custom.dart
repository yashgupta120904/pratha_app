import 'package:flutter/material.dart';
import 'package:pratha_app/data/data.dart';

class LeadingCustom extends StatelessWidget {
  const LeadingCustom({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            leading_image,
            height: 40, 
            fit: BoxFit.contain,
          ),
          const SizedBox(
              width: 8), 
          Text(title),
        ]);
  }
}
