import 'package:flutter/material.dart';
import 'package:ordering_app/page_substructers/my_drawer_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 42,
          toolbarHeight: 62,
          backgroundColor: Colors.orange,
          title: const Text(
            "Yemek Perileri",
            style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 35,
              ),
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [Image.asset("assets/images/foods.jpg")],
            ),
          ),
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
