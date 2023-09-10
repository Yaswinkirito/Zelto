import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zelto/pages/components/other_services.dart';
import 'package:zelto/pages/components/quick_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> path = ["refer", "join elite"];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * (298 / 1015)),
        child: Container(
            height: (size.height * (298 / 1015)),
            decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.02, -1.00),
                  end: Alignment(-0.02, 1),
                  colors: [
                    Color(0x380017E6),
                    Color(0xFF000347),
                    Color(0xFF000247)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ]),
            child: Column(children: [
              const SizedBox(
                height: 8,
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.near_me,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.amiko(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 1.33,
                    letterSpacing: -0.50,
                  ),
                ),
                trailing: const ImageIcon(AssetImage("assets/images/chat.png")),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Container(
                  height: (181 / 1015) * size.height,
                  width: (341 / 360) * size.width,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Electrician.png"),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                ),
              ),
            ])),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: (24 / 360) * size.width),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 19,
            ),
            Text(
              'Quick Service',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const QuickService(),
            const SizedBox(height: 30),
            Text(
              'Other Services',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 150, child: OtherServices()),
            Text(
              'Explore',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: (148 / 1015) * size.height,
              width: size.width,
              child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AspectRatio(
                        aspectRatio: 148 / 102,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: (19 / 360) * size.width, top: 14),
                          child: Container(
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/${path[index]}.png"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ));
                  }),
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/letter-z 1.png")),
                label: "Zelto"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/categories 1.png"),
                ),
                label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2), label: "Profile")
          ]),
    );
  }
}
