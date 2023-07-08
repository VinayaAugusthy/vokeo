import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:vokeo/core/constants/constants.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: size.width / 2,
                height: size.width / 2,
                child: Image.asset('assets/images/otp.png')),
            const Text(
              'Enter OTP',
              style: textBold,
            ),
            kheight20,
            OTPTextField(
              length: 6,
              width: size.width,
              fieldWidth: 40,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 10,
              onChanged: (value) {},
            ),
            // OTPTextField(
            //   length: 5,
            //   width: MediaQuery.of(context).size.width,
            //   fieldWidth: 50,
            //   style: TextStyle(fontSize: 17),
            //   textFieldAlignment: MainAxisAlignment.spaceAround,
            //   fieldStyle: FieldStyle.underline,
            //   onCompleted: (pin) {
            //     print("Completed: " + pin);
            //   },
            // ),
            kheight30,
            ElevatedButton(onPressed: () {}, child: const Text('Validate OTP'))
          ],
        ),
      ),
    );
  }
}
