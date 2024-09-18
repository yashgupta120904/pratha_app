import 'package:flutter/material.dart';
import 'package:pratha_app/data/treatmentdata.dart';
import 'package:pratha_app/screens/treatments.dart';
import 'package:pratha_app/screens/partners.dart';
import 'package:pratha_app/screens/static.dart';
import 'package:pratha_app/widgets/custom_button.dart';
import 'package:pratha_app/widgets/circle_button.dart';
import 'package:pratha_app/widgets/leading_custom.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          
          title:  Padding(
            padding: const EdgeInsets.only(right: 70),
            child: LeadingCustom(title: "More")
          )
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            text: "Team Success Club",
                            icon: Icons.people,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const InfoDetailScreen(index: 5)));
                            }),
                        const SizedBox(width: 25),
                        CustomButton(
                            text: "Bookstore ",
                            icon: Icons.store,
                            onPressed: () async {
                              var url = Uri.parse(
                                  "https://prathaayurveda.in/bookstore/");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              }
                            })
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            text: "Live Telecast ",
                            icon: Icons.connected_tv,
                            onPressed: () async {
                              var url = Uri.parse(
                                  "https://www.youtube.com/@prathaayurveda7448");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              }
                            }),
                        const SizedBox(width: 25),
                        CustomButton(
                            text: "Treatments",
                            icon: Icons.local_hospital_sharp,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           TreatmentScreen(
                                          hello: tdetail
                                          )));
                            })
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            text: "FAQs",
                            icon: Icons.message,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const InfoDetailScreen(index: 4)));
                            }),
                        const SizedBox(width: 30),
                        CustomButton(
                            text: "Contact Us ",
                            icon: Icons.person_pin,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const InfoDetailScreen(index: 1)));
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleButton(
                            text: "Privacy Policy",
                            icon: Icons.privacy_tip,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const InfoDetailScreen(index: 6)));
                            }),
                        const SizedBox(
                          width: 7,
                        ),
                        CircleButton(
                            text: "T & C",
                            icon: Icons.receipt_long,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const InfoDetailScreen(index: 2)));
                            }),
                        const SizedBox(
                          width: 7,
                        ),
                        CircleButton(
                            text: "Shipping Policy",
                            icon: Icons.local_shipping,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const InfoDetailScreen(index: 3)));
                            }),
                        const SizedBox(
                          width: 7,
                        ),
                        CircleButton(
                            text: "Partners",
                            icon: Icons.handshake,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PartnersScreen()));
                            }),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
