import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ordering_app/cubits/basketpage_cubit.dart';
import 'package:ordering_app/cubits/food_detail_cubit.dart';
import 'package:ordering_app/cubits/homepage_cubit.dart';
import 'package:ordering_app/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(
          create: (context) => BasketPageCubit(),
        ),
        BlocProvider(
          create: (context) => FoodDetailCubit(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: const HomePage()),
    );
  }
}
