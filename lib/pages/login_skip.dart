import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zelto/pages/otp_page.dart';

import 'components/components.dart';

class SkipLogin extends StatelessWidget {
  const SkipLogin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController loginController = TextEditingController();
    TextEditingController loginController2 = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: const [
          Icon(
            Icons.close,
            color: Colors.black,
            size: 32,
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 53,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            alignment: Alignment.center,
            width: size.width * (99 / 360),
            height: size.height * (78 / 800),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/zeltologo.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, right: 9),
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
                    fontSize: 20,
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
                  height: 11,
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
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Send OTP via message',
                      style: GoogleFonts.poppins(
                        color: const Color(0xF41D1818),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: TextPoppins(
                            text: 'Send OTP via',
                            size: 9,
                            weight: FontWeight.w500,
                            color: blendGrey,
                          ),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                CardVerification2(
                    size: size, loginController: loginController2),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class CardVerification2 extends StatefulWidget {
  const CardVerification2({
    super.key,
    required this.size,
    required this.loginController,
  });

  final Size size;
  final TextEditingController loginController;

  @override
  State<CardVerification2> createState() => _CardVerificationState2();
}

class _CardVerificationState2 extends State<CardVerification2> {
  int timeLeft = 30;
  late Timer timer;

  void _startCountDown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 14,
        ),
        TextPoppins(
          text: 'One Time Password (OTP)',
          size: 12,
          weight: FontWeight.w300,
          color: blendGrey,
        ),
        const SizedBox(
          height: 6,
        ),
        VerificationContainer(
          size: widget.size,
          controller: widget.loginController,
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (timeLeft == 0) ? "Resend OTP" : "Resend OTP(${timeLeft}s)",
                style: GoogleFonts.poppins(
                  color: const Color(0xF41D1818),
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextPoppins(
                text: 'Change',
                color: blendGrey,
                size: 9,
                weight: FontWeight.w700,
              ),
              const SizedBox(
                height: 8,
              ),
              const Terms(),
              const SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  child: LoginButton(
                    text: "Login",
                    size: widget.size,
                  ),
                  onTap: () {
                    dispose();

                    context.go("/Home");
                  },
                ),
              )
            ])
      ],
    );
  }
}
