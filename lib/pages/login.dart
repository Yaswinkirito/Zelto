import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/components.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController loginController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
            padding: EdgeInsets.only(
              top: size.height * (146 / 800),
              left: size.width * (30 / 360),
              right: size.width * (30 / 360),
            ),
            child: Container(
              alignment: Alignment.bottomCenter,
              width: size.width * (300 / 360),
              height: size.height * (241 / 800),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/zeltologo.png"),
                  fit: BoxFit.contain,
                ),
              ),
              child: Text('THE ONLY HOME SERVICE PARTNER YOU EVER NEED',
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400)),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Container(
            width: double.infinity,
            height: size.height * (272 / 800),
            padding: const EdgeInsets.only(left: 20, right: 9),
            decoration: const ShapeDecoration(
              color: Color(0x3F92ACD3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 17,
                ),
                Text(
                  'Login with Mobile Number',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Book your service easily',
                  style: GoogleFonts.poppins(
                    color: const Color(0xF41D1818),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  'Mobile Number',
                  style: GoogleFonts.poppins(
                    color: const Color(0xF41D1818),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextContainer(
                  size: size,
                  controller: loginController,
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  child: LoginButton(
                    text: "Login with OTP",
                    size: size,
                  ),
                  onTap: () {
                    context.go("/Otp");
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                Center(
                  child: GestureDetector(
                    child: const Text(
                      'Skip Login >',
                      style: TextStyle(
                        color: Color(0xFFE81919),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      context.go("/home");
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
