import 'package:event_flow/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helping_widgets/common_gradient_backgroud.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: gradientBackground(),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Text(
                    "Welcome to EventFlow",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.075,  // Slightly larger for prominence
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,  // Add letter spacing for modern look
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,  // Adjusted for better visual separation
                  ),
                  Text(
                    "Connect. Share. Celebrate.",
                    style: TextStyle(
                      color: Colors.white70,  // Softer white for tagline
                      fontSize: size.width * 0.05,  // Slightly bigger font size
                      fontStyle: FontStyle.italic,  // Add italic for style
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                    ),
                    child: Image.asset(
                      'assets/onboardIcon.png',
                      height: size.height * 0.3,  // Increased image size slightly
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,  // More space between image and next section
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),  // Add padding for better content alignment
                    decoration: const BoxDecoration(
                      color: Color(0xFFffffff),  // White background for text section
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,  // Stronger shadow for depth
                          blurRadius: 8,
                          spreadRadius: 3,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),  // More rounded corners for modern look
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                          ),
                          child: Text(
                            "Transform your online network into real-life connections",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF274560),  // New deep blue for readability
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,  // Add spacing for polished look
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,  // Space between the two paragraphs
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                          ),
                          child: Text(
                            "EventFlow makes it simple to create, discover, and share events with your social circle, while giving you the tools to monetize your experiences.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF62757f),  // Soft gray for secondary text
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.normal,
                              height: 1.4,  // Line height for better readability
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.08,  // More horizontal padding for button
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 14),  // Taller button
                            color: const Color(0xFF004aad),  // Button matches app color scheme
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),  // Rounded corners for button
                            ),
                            onPressed: () {
                              Get.to(() => LoginPage());
                            },
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: size.width * 0.05,
                                color: Colors.white,  // White text for contrast
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
