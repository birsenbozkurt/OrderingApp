import 'dart:ui';

import 'package:flutter/material.dart';

class ShoppingBasketPage extends StatefulWidget {
  const ShoppingBasketPage({super.key});

  @override
  State<ShoppingBasketPage> createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim",
            style: TextStyle(
              fontSize: 23,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            )),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 580),
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Sepeti Onayla",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
