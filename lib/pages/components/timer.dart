import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  int timeLeft = 30;
  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
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
  Widget build(BuildContext context) {
    return Text(
      (timeLeft == 0) ? "Resend OTP" : "Resend OTP(${timeLeft}s)",
      style: GoogleFonts.poppins(
        color: const Color(0xF41D1818),
        fontSize: 9,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
