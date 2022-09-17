// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ordering_app/entity/foods.dart';

class FoodDetailPage extends StatefulWidget {
  Foods yemek;
  FoodDetailPage({
    required this.yemek,
  });

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yemek Detay", style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic)),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
