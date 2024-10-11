import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/creat_event_controller.dart';

class HomeScreen extends StatelessWidget {
  final AddEventController controller = Get.find<AddEventController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
