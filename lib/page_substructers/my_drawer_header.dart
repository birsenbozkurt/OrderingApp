import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/fairy.png'),
                )),
          ),
          Text(
            "Hesabım",
            style: TextStyle(color: Colors.white, fontSize: 24, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

//Sonra Kullanılmak Üzere Eklendi.
//  drawer: Drawer(
//           child: SingleChildScrollView(
//               child: Container(
//             child: Column(
//               children: [
//                 MyHeaderDrawer(),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.favorite_outline_sharp,
//                       size: 30,
//                     ),
//                     iconColor: Colors.orange,
//                     title: const Text(
//                       'Favoriler',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     onTap: () {},
//                   ),
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.paste_sharp,
//                     size: 30,
//                   ),
//                   iconColor: Colors.orange,
//                   title: const Text(
//                     'Önceki Siparişler',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   onTap: () {},
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.location_on,
//                     size: 30,
//                   ),
//                   iconColor: Colors.orange,
//                   title: const Text(
//                     'Adresler',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   onTap: () {},
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.playlist_add_check_circle_outlined,
//                     size: 30,
//                   ),
//                   iconColor: Colors.orange,
//                   title: const Text(
//                     'Kuponlar',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   onTap: () {},
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.credit_score_outlined,
//                     size: 30,
//                   ),
//                   iconColor: Colors.orange,
//                   title: const Text(
//                     'Ödeme',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   onTap: () {},
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.help_rounded,
//                     size: 30,
//                   ),
//                   iconColor: Colors.orange,
//                   title: const Text(
//                     'Yardım',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   onTap: () {},
//                 ),
//                 Divider(
//                   height: 30,
//                   thickness: 3,
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.settings,
//                     size: 30,
//                   ),
//                   iconColor: Colors.orange,
//                   title: const Text(
//                     'Ayarlar',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   onTap: () {},
//                 ),
//                 ListTile(
//                   leading: Icon(
//                     Icons.exit_to_app,
//                     size: 30,
//                   ),
//                   iconColor: Colors.orange,
//                   title: const Text(
//                     'Çıkış Yap',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           )),
//         )
