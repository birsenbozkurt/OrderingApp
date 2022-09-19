import 'package:flutter/cupertino.dart';
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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leadingWidth: 42,
          toolbarHeight: 62,
          backgroundColor: Colors.orange,
          leading: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                  //close drawer, if drawer is open
                } else {
                  scaffoldKey.currentState!.openDrawer();
                  //open drawer, if drawer is closed
                }
              }),
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
                      color: Colors.grey.shade300,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: Colors.orange.shade700,
                            width: 2.0,
                          )),
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 60),
                            child: Icon(
                              CupertinoIcons.pin_fill,
                              size: 27,
                              color: Colors.black87,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}",
                              width: 80,
                              height: 80,
                            ),
                          ),
                          Container(),
                          Text(
                            "${yemek.yemek_adi} - ${yemek.yemek_fiyat} TL",
                            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.black54),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              CupertinoIcons.hand_point_right_fill,
                              size: 30,
                              color: Colors.black26,
                            ),
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
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
              child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListTile(
                    leading: Icon(
                      Icons.favorite_outline_sharp,
                      size: 30,
                    ),
                    iconColor: Colors.orange,
                    title: const Text(
                      'Favoriler',
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.paste_sharp,
                    size: 30,
                  ),
                  iconColor: Colors.orange,
                  title: const Text(
                    'Önceki Siparişler',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                  iconColor: Colors.orange,
                  title: const Text(
                    'Adresler',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.playlist_add_check_circle_outlined,
                    size: 30,
                  ),
                  iconColor: Colors.orange,
                  title: const Text(
                    'Kuponlar',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.credit_score_outlined,
                    size: 30,
                  ),
                  iconColor: Colors.orange,
                  title: const Text(
                    'Ödeme',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.help_rounded,
                    size: 30,
                  ),
                  iconColor: Colors.orange,
                  title: const Text(
                    'Yardım',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                Divider(
                  height: 30,
                  thickness: 3,
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  iconColor: Colors.orange,
                  title: const Text(
                    'Ayarlar',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    size: 30,
                  ),
                  iconColor: Colors.orange,
                  title: const Text(
                    'Çıkış Yap',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )),
        ));
  }
}
