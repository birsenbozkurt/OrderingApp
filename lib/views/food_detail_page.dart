// ignore_for_file: public_member_api_docs, sort_constructors_firs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ordering_app/cubits/basketpage_cubit.dart';
import 'package:ordering_app/cubits/food_detail_cubit.dart';
import 'package:ordering_app/entity/basket_foods.dart';
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
    context.read<BasketPageCubit>().sepettekiYemekleriYukle("BirsenBozkurt");
  }

  int yemek_siparis_adet = 1;
  var click = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yemek Detay", style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic)),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            Container(),
            Image.network(width: 200, height: 200, "http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}"),
            Container(),
            Text("${widget.yemek.yemek_adi}"),
            Container(),
            Text("${widget.yemek.yemek_fiyat} ₺"),
            Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 35,
                  onPressed: () {
                    setState(() {
                      if (yemek_siparis_adet == 1) {
                        return;
                      }
                      yemek_siparis_adet--;
                    });
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                Text("${yemek_siparis_adet}"),
                IconButton(
                  onPressed: (() {
                    setState(() {
                      yemek_siparis_adet++;
                    });
                  }),
                  icon: Icon(Icons.add_circle_outline_outlined),
                ),
              ],
            ),
            Container(),
            // BlocBuilder<BasketPageCubit, List<BasketFoods>>(builder: ((context, yemeklerListesi) {
            //   return ElevatedButton(
            //       onPressed: () {
            //         for (var i = 0; i < yemeklerListesi.length; i++) {
            //           if (widget.yemek.yemek_adi == yemeklerListesi[i].yemek_adi) {
            //             click = 0;
            //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //               duration: Duration(seconds: 1),
            //               content: Text("Ürün Sepette"),
            //             ));
            //             return;
            //           }
            //         }
            //         if(click==1){
            //           context.read<FoodDetailCubit>().
            //         }
            //       },
            //       child: child);
            // }))
          ],
        ),
      ),
    );
  }
}
