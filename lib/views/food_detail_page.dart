// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs, sort_constructors_firs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ordering_app/cubits/basketpage_cubit.dart';
import 'package:ordering_app/cubits/food_detail_cubit.dart';
import 'package:ordering_app/entity/basket_foods.dart';
import 'package:ordering_app/entity/foods.dart';
import 'package:ordering_app/views/shopping_basket_page.dart';

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
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_sharp),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text("Yemek Detay", style: TextStyle(fontSize: 23, color: Colors.white, fontStyle: FontStyle.italic)),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            Card(
                color: Colors.grey.shade300,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: Colors.orange.shade700,
                      width: 2.0,
                    )),
                child: Image.network(width: 200, height: 200, "http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}")),
            Container(
              height: 10,
            ),
            Text(
              "${widget.yemek.yemek_adi}",
              style: TextStyle(fontSize: 25),
            ),
            Container(),
            Text(
              "${widget.yemek.yemek_fiyat} ???",
              style: TextStyle(fontSize: 35),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Container(
                child: ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.download_rounded), label: Text("Adet Se??iniz")),
                height: 50,
                width: 250,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 35,
                  color: Colors.orange.shade700,
                  onPressed: () {
                    setState(() {
                      if (yemek_siparis_adet == 1) {
                        return;
                      }
                      yemek_siparis_adet--;
                    });
                  },
                  icon: Icon(Icons.arrow_circle_down_outlined),
                ),
                Text(
                  "${yemek_siparis_adet}",
                  style: TextStyle(fontSize: 30),
                ),
                IconButton(
                  iconSize: 35,
                  color: Colors.orange.shade700,
                  onPressed: (() {
                    setState(() {
                      yemek_siparis_adet++;
                    });
                  }),
                  icon: Icon(Icons.arrow_circle_up_outlined),
                ),
              ],
            ),
            Container(
              height: 40,
            ),
            BlocBuilder<BasketPageCubit, List<BasketFoods>>(builder: (context, yemeklerListesi) {
              return ElevatedButton.icon(

                  style: ElevatedButton.styleFrom(minimumSize: Size(300, 60), primary: Colors.orange),
                  onPressed: () {
                    for (var i = 0; i < yemeklerListesi.length; i++) {
                      if (widget.yemek.yemek_adi == yemeklerListesi[i].yemek_adi) {
                        click = 0;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("Bu ??r??n Sepete Eklendi"),
                        ));
                        return;
                      }
                    }
                    if (click == 1) {
                      context.read<FoodDetailCubit>().YemekEkle(widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi,
                          int.parse(widget.yemek.yemek_fiyat), yemek_siparis_adet, "BirsenBozkurt");
                      click--;

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 2),
                        content: Text("??r??n Ba??ar??yla Eklendi, Sepete Gitmek ??ster Misiniz ?"),
                        action: SnackBarAction(
                          label: "Evet",
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => ShoppingBasketPage())));
                          },
                        ),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Bu ??r??n Zaten Sepette !"),
                      ));
                    }
                  },
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: Text("Sepete Ekle"));
            }),
          ],
        ),
      ),
    );
  }
}
