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
                                        Text("${yemek.yemek_siparis_adet} Adet ${yemek.yemek_adi}"),
                                      ],
                                    ),
                                    Container(
                                      height: 40,
                                    ),
                                    Text("Toplam Fiyat: ${int.parse(yemek.yemek_fiyat) * int.parse(yemek.yemek_siparis_adet)} ₺"),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(primary: Colors.orange.shade700),
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
                          "Sepet Toplamı: ${sepetToplami} ₺",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: ElevatedButton(
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
                          child: Text("Sepeti Onayla")),
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
              title: Text(
                "Sepetiniz",
                style: TextStyle(fontFamily: 'PtBold', fontSize: 30),
              ),
              centerTitle: true,
              backgroundColor: Colors.redAccent,
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
