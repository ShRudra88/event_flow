import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../controller/profile_controller.dart';
import '../../helping_widgets/common_gradient_backgroud.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: gradientBackground(), // Applying gradient background
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Obx(() => CircleAvatar(
                    radius: 60,
                    backgroundImage: controller.selectedImagePath.value.isNotEmpty
                        ? FileImage(File(controller.selectedImagePath.value))
                        : const AssetImage('assets/placeholder.png') as ImageProvider,
                    child: controller.selectedImagePath.value.isEmpty
                        ? const Icon(Icons.camera_alt, size: 50, color: Colors.white)
                        : null,
                  )),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Haridas Roy',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Department of CSE',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Batch: CSE 20',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
