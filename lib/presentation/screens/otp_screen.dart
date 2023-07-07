import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/presentation/widget/call_textField.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

TextEditingController otpController = TextEditingController();

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Enter OTP',
              //   style: textBold,
              // ),
              SizedBox(
                  width: size.width / 2,
                  height: size.width / 2,
                  child: Image.asset('assets/images/otp.png')),
              callTextField(
                  labelName: 'OTP',
                  controllerName: otpController,
                  keys: TextInputType.number),
              kheight30,
              ElevatedButton(
                  onPressed: () {}, child: const Text('Validate OTP'))
            ],
          ),
        ),
      ),
    );
  }
}
