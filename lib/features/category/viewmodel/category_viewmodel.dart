import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/category/model/category_model.dart';

final categoryProvider = Provider<List<Category>>((ref) {
  return [
    Category(title: 'Business', iconPath: 'assets/icons/handshake.svg', backgroundColor: Colors.green.shade100),
    Category(title: 'Food & Culture', iconPath: 'assets/icons/fork_knife.svg', backgroundColor: Colors.blue.shade100),
    Category(title: 'Office Productivity', iconPath: 'assets/icons/coffee.svg', backgroundColor: Colors.red.shade100),
    Category(title: 'Finance & Accounting', iconPath: 'assets/icons/credit_card.svg', backgroundColor: Colors.yellow.shade100),
    Category(title: 'IT & Software', iconPath: 'assets/icons/buildings.svg', backgroundColor: Colors.lightBlue.shade100),
    Category(title: 'Office Productivity', iconPath: 'assets/icons/bug_droid.svg', backgroundColor: Colors.purple.shade100),
    Category(title: 'Personal Development', iconPath: 'assets/icons/handshake2.svg', backgroundColor: Colors.grey.shade100),
    Category(title: 'Design', iconPath: 'assets/icons/pen.svg', backgroundColor: Colors.lightGreen.shade100),
    Category(title: 'Lifestyle', iconPath: 'assets/icons/notepad.svg', backgroundColor: Colors.orange.shade100),
    Category(title: 'Photography & Video', iconPath: 'assets/icons/camera.svg', backgroundColor: Colors.blue.shade100),
    Category(title: 'Health & Fitness', iconPath: 'assets/icons/heartbeat.svg', backgroundColor: Colors.purple.shade100),
    Category(title: 'Development', iconPath: 'assets/icons/bug.svg', backgroundColor: Colors.yellow.shade200),
  ];
});
