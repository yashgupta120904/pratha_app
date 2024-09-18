
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pratha_app/data/data.dart';
import 'package:pratha_app/screens/static.dart';
import 'package:pratha_app/screens/more.dart';
import 'package:pratha_app/widgets/custom_button.dart';
import 'package:pratha_app/widgets/leading_custom.dart';
import 'package:pratha_app/widgets/webview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});
 

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeindex = 0;

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: bannerImages.length,
      );

  Widget buildImage(String images, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
 
        child: ClipRRect(
    borderRadius: BorderRadius.circular(12), // Circular border for image
    child: Image.network(
      images,
      fit: BoxFit.cover,
     
    ),
  ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

       

        title:LeadingCustom(title: "PRATHA AYURVEDA")
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Center(
          child: Stack(children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                  height: 255,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) =>
                      setState(() => activeindex = index)),
              itemCount: bannerImages.length,
              itemBuilder: ((context, index, realIndex) {
                final urlImages = bannerImages[index];
                return buildImage(urlImages, index);
              }),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [buildIndicator()],
              ),
            )
          ]),
        ),
        const SizedBox(height: 50),
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: 'About Us',
                      icon: Icons.people,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const InfoDetailScreen(index: 0)));
                      },
                    ),
                    CustomButton(
                        text: 'Shop',
                        icon: Icons.shopping_cart,
                        onPressed: () async {
                          var url = Uri.parse(
                              "https://prathaayurveda.in/medicines-personal-care-wellness-products/");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                        text: 'Appointments',
                        icon: Icons.calendar_today,
                        onPressed: () async {
                          var url = Uri.parse(
                              "http://prathaayurveda.in/best-ayurveda-doctor");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        }),
                    CustomButton(
                      text: 'Radio',
                      icon: Icons.radio,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>RadioScreen()));
                      },
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 140,
              height: 120,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
              ),
              child: Align(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        elevation: 4,
                        shadowColor: Colors.orange,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MoreScreen()));
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.more_horiz_rounded,
                            size: 35,
                            color: Color.fromARGB(255, 210, 136, 40),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Text(
                              "More",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 210, 136, 40),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
