import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pizzaci/menuBar/sepet.dart';
import 'package:pizzaci/menuBar/siparisVer.dart';
import 'package:pizzaci/screens/data.dart';
import 'package:pizzaci/screens/home_screen.dart';
import 'package:pizzaci/menuBar/profilim.dart';

class KampanyaScreen extends StatefulWidget {
  const KampanyaScreen({super.key});

  @override
  State<KampanyaScreen> createState() => _KampanyaScreenState();
}

class _KampanyaScreenState extends State<KampanyaScreen> {

   final items = const [           // //alt menu ıtemlerımı cagırmak için her sayfada böyle bir tanımlama yaptım
    Padding(
      padding: EdgeInsets.all(17.0),
      child: Column(
        children: [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
            size: 20,
          ),
          Text(
            "Anasayfa",
            style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(17.0),
      child: Column(
        children: [
          Icon(
            Icons.star_border,
            color: Colors.white,
            size: 20,
          ),
          Text(
            "Kampanyalar",
            style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(17.0),
      child: Column(
        children: [
          Icon(
            Icons.local_pizza_outlined,
            color: Colors.white,
            size: 20,
          ),
          Text(
            "Sipariş Ver",
            style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(17.0),
      child: Column(
        children: [
          Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.white,
            size: 20,
          ),
          Text(
            "Sepetim",
            style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(17.0),
      child: Column(
        children: [
          Icon(
            Icons.person_2_outlined,
            color: Colors.white,
            size: 20,
          ),
          Text(
            "Profil",
            style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  ];

  int index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });

          switch (selectedIndex) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const KampanyaScreen()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SiparisVerScreen()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SepetScreen()));
              break;
            case 4:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilScreen()));
              break;
          }
        },
        backgroundColor: Colors.white,
        color: Color.fromARGB(206, 255, 166, 50),
        
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber.shade50,
        title: Text('Kampanyalar'),
      ),
      body: MenuMobile(),
    );
  }

  ListView MenuMobile() {               //kampanya sayfası tasarımı buradan başlıyor
    return ListView.builder(
      itemCount: kampanya1.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    kampanya1[index]["image3"].toString(),
                    width: 235,
                  ),
                ),
                SizedBox(width: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    kampanya2[index]["image3"].toString(),
                    width: 235,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget getSelectedWidget({required int index}) {
    switch (index) {
      case 1:
        return const HomeScreen();
      case 2:
        return const KampanyaScreen();
      case 3:
        return const SiparisVerScreen();
      case 4:
        return const SepetScreen();
      case 5:
        return const ProfilScreen();
    }
    return Container();
  }
}
