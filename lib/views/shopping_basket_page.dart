import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ordering_app/cubits/basketpage_cubit.dart';

class ShoppingBasketPage extends StatefulWidget {
  const ShoppingBasketPage({super.key});

  @override
  State<ShoppingBasketPage> createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {
  @override
  void initState() {
    super.initState();
    // context.read<BasketPageCubit>().sepettekiYemekleriYukle("BirsenBozkurt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_sharp),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text("Sepetim",
            style: TextStyle(
              fontSize: 23,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(),
    );
  }
}
