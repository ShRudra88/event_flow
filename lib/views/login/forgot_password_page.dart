import 'package:event_flow/views/login/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helping_widgets/common_gradient_backgroud.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Forgot Password'),backgroundColor: Colors.blue,),

        body: Container(
          decoration: gradientBackground(), // Applying gradient background
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Trigger OTP sending logic here
                    Get.to(() => OtpPage());
                  },
                  child: const Text('Send OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
