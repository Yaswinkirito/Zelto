import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickService extends StatelessWidget {
  const QuickService({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<List<String>> iconpath = [
      ["electrician", "Electrician"],
      ["plumber", "Plumber"],
      ["service", "A/C"],
      ["cleaning-staff", "House\nCleaning"],
      ["car-service", "Car\nWashing"],
      ["lawn-mower", "Grass\nCutting"],
      ["paint-roller", "Painting"],
      ["water-well", "Well\nCleaning"],
    ];
    return Container(
      height: 190,
      padding: const EdgeInsets.only(top: 19),
      child: GridView.builder(
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/icons/${iconpath[index][0]}.png",
                      width: (33 / 360) * size.width,
                      height: (33 / 360) * size.width,
                    ),
                    Text(
                      iconpath[index][1],
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ]),
              onTap: () {
                context.go("/loginskip");
              },
            );
          }),
    );
  }
}
