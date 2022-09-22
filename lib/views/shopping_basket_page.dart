import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ordering_app/cubits/basketpage_cubit.dart';
import 'package:ordering_app/entity/basket_foods.dart';

var sepetBosMu;
var sepetToplami;

class ShoppingBasketPage extends StatefulWidget {
  const ShoppingBasketPage({super.key});

  @override
  State<ShoppingBasketPage> createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {
  @override
  void initState() {
    super.initState();
    context.read<BasketPageCubit>().sepettekiYemekleriYukle("BirsenBozkurt");
    sepetToplami = 0;
    sepetBosMu = false;
  }

  @override
  Widget build(BuildContext context) {
    return !sepetBosMu
        ? Scaffold(
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
            body: BlocBuilder<BasketPageCubit, List<BasketFoods>>(builder: (context, yemeklerListesi) {
              sepetToplami = 0;
              for (var i = 0; i < yemeklerListesi.length; i++) {
                sepetToplami += int.parse(yemeklerListesi[i].yemek_fiyat) * int.parse(yemeklerListesi[i].yemek_siparis_adet);
              }
              if (yemeklerListesi.isNotEmpty) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: yemeklerListesi.length,
                        itemBuilder: (context, indeks) {
                          var yemek = yemeklerListesi[indeks];

                          return Card(
                            color: Colors.grey.shade300,
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                  color: Colors.orange,
                                  width: 2.0,
                                )),
                            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}",
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                                Container(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Text("${yemek.yemek_siparis_adet} Adet ${yemek.yemek_adi}",style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.black54),),
                                      ],
                                    ),
                                    Container(
                                      height: 40,
                                    ),
                                    Text("Toplam Fiyat: ${int.parse(yemek.yemek_fiyat) * int.parse(yemek.yemek_siparis_adet)} ₺",style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.black54),),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: ElevatedButton(

                                      style: ElevatedButton.styleFrom(primary: Colors.orange,minimumSize: Size(60,50)),
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("Bu Ürünü Silmek İstediğinize Emin Misiniz?"),
                                          action: SnackBarAction(
                                            label: "Evet",
                                            onPressed: () {
                                              setState(() {
                                                print(yemeklerListesi);
                                                context.read<BasketPageCubit>().yemekSil(int.parse(yemek.sepet_yemek_id), "BirsenBozkurt");
                                              });

                                              if (yemeklerListesi.length == 1) {
                                                setState(() {
                                                  sepetBosMu = true;
                                                  yemeklerListesi.clear();
                                                });
                                              }
                                            },
                                          ),
                                        ));
                                      },
                                      child: Text("Sil")),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: Container(
                        width: 300,
                        height: 50,
                        color: Colors.transparent,
                        child: Text(
                          "Sepet Toplamı: ${sepetToplami} ₺", style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.black54),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(minimumSize: Size(300, 60), primary: Colors.orange),
                          onPressed: () {
                            for (var i = 0; i < yemeklerListesi.length; i++) {
                              context.read<BasketPageCubit>().yemekSil(int.parse(yemeklerListesi[i].sepet_yemek_id), "BirsenBozkurt");
                            }
                            setState(() {
                              sepetBosMu = true;
                              yemeklerListesi.clear();
                            });
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(title: Text("Sepet Onaylandı"), content: Text("Sepet Toplamı: ${sepetToplami}"), actions: [
                                    TextButton(
                                        child: Text("Tamam"),
                                        onPressed: () {
                                          Navigator.of(context).popUntil((route) => route.isFirst);
                                        })
                                  ]);
                                });
                          },
                          child: Text("Sepeti Onayla",style: TextStyle(fontSize: 20,color: Colors.black ),)),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sepetiniz boş"),
                      Container(
                        height: 50,
                      ),
                      Icon(Icons.local_mall, size: 100),
                    ],
                  ),
                );
              }
            }),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Text(
                "Sepetiniz",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              centerTitle: true,

              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sepetiniz boş"),
                  Container(
                    height: 50,
                  ),
                  Icon(Icons.local_mall, size: 100),
                ],
              ),
            ),
          );
  }
}
