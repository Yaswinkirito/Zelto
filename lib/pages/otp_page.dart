import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/components.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color blendGrey = const Color(0xF41D1818);

class Otp extends StatelessWidget {
  const Otp({super.key});

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
              top: size.height * (73 / 800),
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
            padding: const EdgeInsets.only(left: 20, right: 9),
            decoration: const ShapeDecoration(
              color: Color(0x3F92ACD3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
            ),
            child:
                CardVerification(size: size, loginController: loginController),
          ),
        )
      ]),
    );
  }
}

class CardVerification extends StatefulWidget {
  const CardVerification({
    super.key,
    required this.size,
    required this.loginController,
  });

  final Size size;
  final TextEditingController loginController;

  @override
  State<CardVerification> createState() => _CardVerificationState();
}

class _CardVerificationState extends State<CardVerification> {
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
          height: 17,
        ),
        const TextPoppins(
          text: 'Login with Mobile Number',
          color: Colors.black,
          size: 16,
          weight: FontWeight.w500,
        ),
        TextPoppins(
          text: 'Book your service easily',
          size: 12,
          weight: FontWeight.w300,
          color: blendGrey,
        ),
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
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            (timeLeft == 0) ? "Resend OTP" : "Resend OTP(${timeLeft}s)",
            style: GoogleFonts.poppins(
              color: const Color(0xF41D1818),
              fontSize: 9,
              fontWeight: FontWeight.w500,
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
          )
        ]),
        TextPoppins(
          text: 'Change',
          color: blendGrey,
          size: 9,
          weight: FontWeight.w700,
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
      ],
    );
  }
}
