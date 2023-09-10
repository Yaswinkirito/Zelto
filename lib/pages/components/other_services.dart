import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherServices extends StatelessWidget {
  const OtherServices({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> item = [
      ["Junk \nCollection", "furniture 1"],
      ["Plastic \nCollection", "plastic 1"],
      ["Packers & \nMovers", "moving-home 1"]
    ];

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, index) {
          return Stack(
            alignment: Alignment.topLeft,
            children: [
              SvgPicture.asset("assets/images/Rectangle 674.svg"),
              Positioned(
                left: 10,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item[index][0],
                      style: GoogleFonts.aBeeZee(
                        color: const Color(0xFF030D71),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.15,
                        letterSpacing: -0.50,
                      ),
                    ),
                    Container(
                      width: 105,
                      height: 89,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/${item[index][1]}.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
