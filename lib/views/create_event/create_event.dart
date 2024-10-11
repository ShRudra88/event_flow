import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../controller/creat_event_controller.dart';
import '../../helping_widgets/common_gradient_backgroud.dart';

class CreateEventView extends StatelessWidget {
  final AddEventController controller = Get.put(AddEventController());

  CreateEventView({super.key});

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.imagePath.value = image.path; // Save the picked image path in controller
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
        actions: [
          TextButton(
            onPressed: () {
              // Add the new event using the controller
              controller.addEvent(
                controller.titleController.text,
                DateFormat('dd MMM yyyy').format(controller.startDate.value),
              );

              // Navigate back to HomeScreen
              Get.back();
            },
            child: const Text('Create', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: gradientBackground(), // Applying the gradient background
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Obx(() {
                  return Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: controller.imagePath.value.isNotEmpty
                          ? DecorationImage(
                        image: FileImage(File(controller.imagePath.value)),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: controller.imagePath.value.isEmpty
                        ? const Center(
                      child: Text('Pick an Image!', style: TextStyle(fontSize: 18)),
                    )
                        : null,
                  );
                }),
              ),
              const SizedBox(height: 16),
              const Text('Choose a Catchy Title!', style: TextStyle(fontSize: 18, color: Colors.white)),
              TextField(
                controller: controller.titleController,
                decoration: const InputDecoration(
                  hintText: 'Event Title',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text('Where can we find you?', style: TextStyle(fontSize: 18, color: Colors.white)),
              TextButton(
                onPressed: () {
                  // Logic to pick location
                },
                child: const Text('Pick Location', style: TextStyle(color: Colors.blue)),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Start date:', style: TextStyle(fontSize: 18, color: Colors.white)),
                        Obx(() {
                          return TextButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: controller.startDate.value,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                controller.startDate.value = pickedDate;
                              }
                            },
                            child: Text(
                              DateFormat('dd MMM yyyy').format(controller.startDate.value),
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                        Obx(() {
                          return TextButton(
                            onPressed: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: controller.startTime.value,
                              );
                              if (pickedTime != null) {
                                controller.startTime.value = pickedTime;
                              }
                            },
                            child: Text(
                              controller.startTime.value.format(context),
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('End date:', style: TextStyle(fontSize: 18, color: Colors.white)),
                        Obx(() {
                          return TextButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: controller.endDate.value,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                controller.endDate.value = pickedDate;
                              }
                            },
                            child: Text(
                              DateFormat('dd MMM yyyy').format(controller.endDate.value),
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                        Obx(() {
                          return TextButton(
                            onPressed: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: controller.endTime.value,
                              );
                              if (pickedTime != null) {
                                controller.endTime.value = pickedTime;
                              }
                            },
                            child: Text(
                              controller.endTime.value.format(context),
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Private', style: TextStyle(fontSize: 18, color: Colors.white)),
                  const Spacer(),
                  Obx(() {
                    return Switch(
                      value: controller.isPrivate.value,
                      onChanged: (value) {
                        controller.isPrivate.value = value;
                      },
                      activeColor: Colors.blue,
                    );
                  }),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Categories', style: TextStyle(fontSize: 18, color: Colors.white)),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: controller.categories.map((category) {
                  return Obx(() {
                    return ChoiceChip(
                      label: Text(category),
                      selected: controller.selectedCategories.contains(category),
                      onSelected: (selected) {
                        controller.toggleCategory(category);
                      },
                      labelStyle: TextStyle(
                        color: controller.selectedCategories.contains(category)
                            ? Colors.white
                            : Colors.black,
                      ),
                      selectedColor: Colors.blueAccent,
                    );
                  });
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
