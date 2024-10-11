import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventController extends GetxController {
  var titleController = TextEditingController();
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;
  var isPrivate = false.obs;
  var categories = ['Conference', 'Sports', 'Food & Drinks'].obs;
  var selectedCategories = <String>[].obs;
  RxString imagePath = ''.obs;

  RxList<Map<String, dynamic>> events = <Map<String, dynamic>>[].obs;

  // Method to add a new event
  void addEvent(String title, String date) {
    events.add({
      'title': title,
      'date': date,
      // Add more details as needed
    });
  }

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }
}

