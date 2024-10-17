import 'package:event_flow/controller/creat_event_controller.dart';
import 'package:event_flow/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final bool showLoginButton;  // New parameter to determine whether to show the login button
  final AddEventController controller = Get.find<AddEventController>();

  HomeScreen({super.key, this.showLoginButton = false});  // Default to false if not provided

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xFFcb6ce6),  // Light purple
                Color(0xFF6a4bc3),  // Intermediate purple
                Color(0xFF004aad),  // Dark blue
              ],
              radius: 1.2,
              center: Alignment(0.0, 0.0),
              focal: Alignment(0.0, 0.0),
              focalRadius: 0.2,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "What's Happening Today",
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (controller.events.isEmpty) {
                    return const Center(
                      child: Text(
                        "No events scheduled yet.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.events.length,
                      itemBuilder: (context, index) {
                        final event = controller.events[index];
                        return Card(
                          color: Colors.white.withOpacity(0.85),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15,
                            ),
                            title: Text(
                              event['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF004aad),
                              ),
                            ),
                            subtitle: Text(
                              event['date'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward,
                              color: Color(0xFF6a4bc3),
                            ),
                            onTap: () {
                              // Handle event tap
                            },
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
              const Spacer(),
              if (showLoginButton) // Conditionally show the login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => LoginPage());  // Navigate to LoginPage
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: const Color(0xFF004aad),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
