import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pizzaci/menuBar/kampanya.dart';
import 'package:pizzaci/menuBar/siparisVer.dart';
import 'package:pizzaci/screens/home_screen.dart';
import 'package:pizzaci/menuBar/profilim.dart';

class SepetScreen extends StatefulWidget {
  const SepetScreen({super.key});

  @override
  State<SepetScreen> createState() => _SepetScreenState();
}

class _SepetScreenState extends State<SepetScreen> {
   final items = const [
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
        title: Text('Sepetim'),
      ),



      body: SingleChildScrollView(        //sepetim tasarımı burada başlıyor
        child: Column(
          children: [
            SepetItem(
                "assets/images/sepet1.png",
                "Pizza Gusto",
                "Bol Malzemos",
                "299TL",
                "Adet Seçiniz",
                "Ödemeye Geç"),
            SizedBox(
              height: 2,
            ),
            SepetItem(
                "assets/images/sepet8.png",
                "Pizza Gusto",
                "Mantarsever",
                "279TL",
                "Adet Seçiniz",
                "Ödemeye Geç"),
            SizedBox(
              height: 2,
            ),
            SepetItem(
                "assets/images/sepet5.png",
                "Pizza Gusto",
                "Ballı Hardallı Tavuklu",
                "299TL",
                "Adet Seçiniz",
                "Ödemeye Geç"),
            SizedBox(
              height: 2,
            ),
            SepetItem(
                "assets/images/sepet4.png",
                "Pizza Gusto",
                "Mangal Sucuklu",
                "299TL",
                "Adet Seçiniz",
                "Ödemeye Geç"),
            SizedBox(
              height: 2,
            ),
            SepetItem(
                "assets/images/sepet10.png",
                "Karışık",
                "Bol Malzemos",
                "299TL",
                "Adet Seçiniz",
                "Ödemeye Geç"),
            SizedBox(
              height: 2,
            ),
            

            
          ],
        ),
      ),
    );
  }
}

Widget SepetItem(String photo, String title, String description, String fiyat,       //sepet için tekrarlamaları önlemek adına widget yazdım
        String beden, String sepet) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 490,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color.fromARGB(23, 158, 158, 158),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    photo,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(155, 0, 0, 0),
                            ),
                          ),
                          SizedBox(
                            width: 220,
                          ),
                          Image.asset("assets/images/p.png",width: 40,)
                          
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(170, 50, 49, 49),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        fiyat,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(194, 247, 247, 247),
                              border: Border.all(
                                  color: Color.fromARGB(255, 234, 218, 37)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              beden,
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 249, 183, 1),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(194, 247, 247, 247),
                              border: Border.all(
                                  color: Color.fromARGB(255, 234, 218, 37)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              sepet,
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 249, 183, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
                height:
                    8), 
          ],
        ),
      ),
    );

  
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
