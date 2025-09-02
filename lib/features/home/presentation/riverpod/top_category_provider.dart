import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/home/data/model/category_model.dart';

final topCategoryProvider = Provider<List<Category>>((ref) {
  return [
    Category(
      title: 'Business',
      iconPath: 'assets/icons/handshake.svg',
      backgroundColor: Color(0xffE4F9E0),
    ),
    Category(
      title: 'Food & Culture',
      iconPath: 'assets/icons/fork_knife.svg',
      backgroundColor: Color(0xffE6F0FD),
    ),
    Category(
      title: 'Office Productivity',
      iconPath: 'assets/icons/coffee.svg',
      backgroundColor: Color(0xffFFE5E5),
    ),
    Category(
      title: 'Finance & Accounting',
      iconPath: 'assets/icons/credit_card.svg',
      backgroundColor: Color(0xffFFF8E0),
    ),
    Category(
      title: 'IT & Software',
      iconPath: 'assets/icons/buildings.svg',
      backgroundColor: Color(0xffE6F0FD),
    ),
  ];
});
