import 'package:flutter/material.dart';
import 'package:pratha_app/Models/t_detailinfo.dart';

import 'package:pratha_app/Models/treatment_info.dart';
import 'package:pratha_app/data/treatmentdata.dart';
import 'package:pratha_app/screens/treatment_details.dart';
import 'package:pratha_app/widgets/leading_custom.dart';

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({super.key,required this.hello});
  final List<TDeatilinfo>hello;
 
  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  void selectedTreatment(BuildContext context, Treatmentfirst treatfirst) {
   
  final treatmentInfo = widget.hello.where((t) => t.id == treatfirst.id).toList();


    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>TreatmentDetails(
                  title: treatfirst.title,
                  treatmentinfo:treatmentInfo
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 70),
          child: LeadingCustom(title: "Treatments"),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.4,
            
          ),
          itemCount: treatment1.length,
          itemBuilder: (context, index) {
            final treatmentfirst = treatment1[index];

            return ElevatedButton(
              onPressed: () {
                selectedTreatment(
                  context,
                  treatmentfirst,
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 7,
                  shadowColor:  Colors.orange),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    treatmentfirst.image,
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    treatmentfirst.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 210, 136, 40)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
