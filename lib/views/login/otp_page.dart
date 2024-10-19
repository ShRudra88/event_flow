/*
import 'package:event_flow/views/login/passward_recovery_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_auth/email_auth.dart';
import '../../helping_widgets/common_gradient_backgroud.dart';

class OtpPage extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  void sendOTP() async{

  }



  OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Enter OTP'),backgroundColor: Colors.blueAccent,),
        body: Container(
          decoration: gradientBackground(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: otpController,
                  decoration: const InputDecoration(
                    labelText: 'OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Validate OTP logic here
                    Get.to(() => PasswordRecoveryPage());
                  },
                  child: const Text('Verify OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/