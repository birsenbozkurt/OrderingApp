import 'package:flutter/material.dart';
import 'package:ordering_app/cubits/homepage_cubit.dart';
import 'package:ordering_app/entity/foods.dart';
import 'package:ordering_app/page_substructers/my_drawer_header.dart';
import 'package:ordering_app/views/food_detail_page.dart';
import 'package:ordering_app/views/shopping_basket_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 42,
          toolbarHeight: 62,
          backgroundColor: Colors.orange,
          title: const Text(
            "Yemek Perileri",
            style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.shopping_bag_outlined),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShoppingBasketPage()),
                  ).then((value) {});
                },
              ),
            ),
          ],
        ),
        body: BlocBuilder<HomePageCubit, List<Foods>>(
          builder: ((context, yemeklerListesi) {
            if (yemeklerListesi.isNotEmpty) {
              return ListView.builder(
                itemCount: yemeklerListesi.length,
                itemBuilder: (context, indeks) {
                  var yemek = yemeklerListesi[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(yemek: yemek))).then((value) {
                        context.read<HomePageCubit>().yemekleriYukle();
                      });
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("foto "),
                          ),
                          Container(),
                          Text("${yemek.yemek_adi}- ${yemek.yemek_fiyat} TL"),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(Icons.ads_click_outlined),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center();
            }
          }),
        ));
  }
}
