import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pratha_app/Models/t_detailinfo.dart';
import 'package:pratha_app/widgets/leading_custom.dart';

class TreatmentDetails extends StatefulWidget {
  const TreatmentDetails({super.key, required this.title, required this.treatmentinfo});

  final String title;
  final List<TDeatilinfo> treatmentinfo;

  @override
  State<TreatmentDetails> createState() => _TreatmentDetailsState();
}

class _TreatmentDetailsState extends State<TreatmentDetails> {
  int activeIndex = 0;

  Widget buildImageWithText(String imageUrl, String title) => Stack(
    children: [
      Container(
  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),

  child: ClipRRect(
    borderRadius: BorderRadius.circular(12), // Circular border for image
    child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ),
  ),
),
      Positioned(
        bottom: 12,
        left: 5,
        right: 5,
        child: Container(
          
          width: double.infinity,
         
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
             // ignore: deprecated_member_use
             color: Colors.black.withOpacity(0.5), // Semi-transparent background
             borderRadius:const  BorderRadius.only(bottomLeft: Radius.circular(10),
             bottomRight: Radius.circular(12))
           ),
    
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 255, 123, 0),
            
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 70),
          child: LeadingCustom(title:widget.title),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.treatmentinfo.length, // Use widget.treatmentinfo.length
        itemBuilder: (context, index) {
          final treatmentItem = widget.treatmentinfo[index]; // Use treatmentItem for clarity

          return Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 255,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (imageIndex, reason) =>
                            setState(() => activeIndex = imageIndex),
                      ),
                      itemCount: treatmentItem.image.length,
                      itemBuilder: (context, imageIndex, realIndex) {
                        final imageUrl = treatmentItem.image[imageIndex];
                        final title = treatmentItem.dtitle[imageIndex]; // Assuming title is a property of TDeatilinfo
                        return buildImageWithText(imageUrl, title.toString());
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5,),
              Text(
                  treatmentItem.title , // Handle potential null values
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 210, 136, 40),
                    fontWeight: FontWeight.bold,
                  ),
                ),

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  treatmentItem.description , // Handle potential null values
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 210, 136, 40),

                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}