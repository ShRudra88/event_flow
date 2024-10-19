import 'package:event_flow/controller/auth_controller.dart';
//import 'package:event_flow/views/login/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helping_widgets/common_gradient_backgroud.dart';
import 'package:email_auth/email_auth.dart';

class ForgotPasswordPage extends StatelessWidget {

final _auth=AuthService();
//final _email=TextEditingController();
final TextEditingController emailController = TextEditingController();

  //final TextEditingController otpController = TextEditingController();
//password recovery page




  ForgotPasswordPage({super.key});


      @override
      Widget build(BuildContext context) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(title: const Text('Forgot Password'),
              backgroundColor: Colors.blue,),

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
                      onPressed: () async {
                        await _auth.sendPasswordResetLink(emailController.text);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("An email for password reset")));
                        Navigator.pop(context);
                      },
                      child: const Text('Send Email'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
