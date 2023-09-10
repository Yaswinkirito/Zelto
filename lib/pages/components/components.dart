import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.text, required this.size});
  final String text;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 334 / 46,
        child: Container(
          width: size.width * (334 / 360),
          padding:
              const EdgeInsets.only(top: 8, left: 95, right: 94, bottom: 8),
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(1.00, -0.02),
              end: Alignment(-1, 0.02),
              colors: [Color(0xE2FF004C), Color(0xFFB906FD)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFFF1F6FF),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ));
  }
}

class TextContainer extends StatelessWidget {
  const TextContainer(
      {super.key, required this.size, required this.controller});
  final Size size;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 334 / 48,
        child: OutlineGradientButton(
          gradient: const LinearGradient(
              colors: [Color(0xFFB906FD), Color(0xE2FF004C)]),
          strokeWidth: 2,
          radius: const Radius.circular(20),
          child: Row(children: [
            Text(
              "+91",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: size.width * (14 / 360),
            ),
            SizedBox(
                width: size.width * (261 / 360),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                  ),
                ))
          ]),
        ));
  }
}

class VerificationContainer extends StatefulWidget {
  const VerificationContainer(
      {super.key, required this.size, required this.controller});
  final Size size;
  final TextEditingController controller;

  @override
  State<VerificationContainer> createState() => _VerificationContainerState();
}

class _VerificationContainerState extends State<VerificationContainer> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 334 / 48,
        child: OutlineGradientButton(
            gradient: const LinearGradient(
                colors: [Color(0xFFB906FD), Color(0xE2FF004C)]),
            strokeWidth: 2,
            radius: const Radius.circular(20),
            child: OtpTextField(
              numberOfFields: 6,
              borderColor: const Color(0x3F33363F),
              focusedBorderColor: const Color(0x3F33363F),
              enabledBorderColor: const Color(0x3F33363F),
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Container();
                    });
              }, // end onSubmit
            )));
  }
}

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 312,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'By confirming OTP, you agree to our ',
              style: GoogleFonts.poppins(
                color: const Color(0xF41D1818),
                fontSize: 9,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextSpan(
              text: 'Terms & Conditions',
              style: GoogleFonts.poppins(
                color: const Color(0xFF2300FF),
                fontSize: 9,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextPoppins extends StatelessWidget {
  const TextPoppins(
      {super.key,
      required this.text,
      required this.size,
      required this.weight,
      required this.color});
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
