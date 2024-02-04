import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pizzaci/menuBar/kampanya.dart';
import 'package:pizzaci/menuBar/profilim.dart';
import 'package:pizzaci/menuBar/sepet.dart';
import 'package:pizzaci/menuBar/siparisVer.dart';
import 'package:pizzaci/screens/giris_screen.dart';
import 'package:pizzaci/screens/menuItem.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = const [                             //alt menu ıtemlerımı cagırmak için her sayfada böyle bir tanımlama yaptım
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
            style: TextStyle(
                color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
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
            style: TextStyle(
                color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
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
            style: TextStyle(
                color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
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
            style: TextStyle(
                color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
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
            style: TextStyle(
                color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
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
        height: 70.0,
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });

          switch (selectedIndex) {         //bu seçimler tıklanınca menubardakı ilgili alana gider
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KampanyaScreen()));
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SiparisVerScreen()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SepetScreen()));
              break;
            case 4:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfilScreen()));
              break;
              case 5:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
              break;
          }
        },
        backgroundColor: Colors.white,
        color: Color.fromARGB(206, 255, 166, 50),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 150,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,
                color: Color.fromARGB(255, 234, 213, 25), size: 30),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(                              //drawer alanımı burada tanımladım
        backgroundColor: Colors.black87,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 80),
                  MenuItem(
                    title: "Siparişlerim",
                    icon: Icon(
                      Icons.storefront,
                      size: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/siparis");
                    },
                  ),
                  MenuItem(
                    title: "Sipariş Takip",
                    icon: Icon(
                      Icons.av_timer,
                      size: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/takip");
                    },
                  ),
                  Divider(),
                  MenuItem(
                    title: "Adreslerim",
                    icon: Icon(
                      Icons.mode_of_travel,
                      size: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/adres");
                    },
                  ),
                  MenuItem(
                    title: "Yorumlar",
                    icon: Icon(
                      Icons.draw_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/yorum");
                    },
                  ),
                  MenuItem(
                    title: "İletişim",
                    icon: Icon(
                      Icons.ring_volume_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/iletisim");
                    },
                  ),
                  Divider(),
                  MenuItem(
                    title: "Profilim",
                    icon: Icon(
                      Icons.person_2_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/profil");
                    },
                  ),
                   Divider(),
                  MenuItem(
                    title: "Çıkış Yap",
                    icon: Icon(
                      Icons.dangerous_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/giris");
                    },
                  ),
                ],
              ),
            ),
            Text(
              "Version 1.0.8",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ), 
      body: Column(              //anasayfa tasarımı buradan başlıyor
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 100,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kampanyalı Menüler",
                        style: TextStyle(
                          color: Color.fromARGB(236, 83, 83, 83),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(width: 15, "assets/images/p.png"),
                          Text(
                            "17.90₺ Pizza Puan",
                            style: TextStyle(
                                color: Color.fromARGB(236, 141, 137, 137),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            KampanyaKutu("assets/images/p2.jpeg",
                                "Orta Boy Fırsatı", "Tıkla Gelsinn.."),
                            KampanyaKutu("assets/images/p4.jpeg",
                                "Orta Boy Fırsatı", "Tıkla Gelsinn.."),
                            KampanyaKutu("assets/images/p1.jpeg",
                                "Orta Boy Fırsatı", "Tıkla Gelsinn.."),
                            KampanyaKutu("assets/images/p2.jpeg",
                                "Orta Boy Fırsatı", "Tıkla Gelsinn.."),
                            KampanyaKutu("assets/images/p4.jpeg",
                                "Orta Boy Fırsatı", "Tıkla Gelsinn.."),
                            KampanyaKutu("assets/images/p1.jpeg",
                                "Orta Boy Fırsatı", "Tıkla Gelsinn.."),
                          ],
                        ),
                      ),
                      Divider(),
                      gecmisSiparis(),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              StoryMenu("assets/images/p1.jpeg", "Kampanyalar"),
                              StoryMenu("assets/images/kek.jpeg", "Tatlılar"),
                              StoryMenu("assets/images/s3.jpeg", "Pizzalar"),
                              StoryMenu("assets/images/s4.jpeg", "Yan Ürünler"),
                              StoryMenu("assets/images/s1.jpeg", "İçecekler"),
                              StoryMenu("assets/images/s5.jpeg", "Soslar"),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_events_outlined,
                              color: Colors.amber,
                            ),
                            Text(
                              "Her 5 Siparişte 1 Pizza Hediye",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/images/yekazan.png",
                        width: 600,
                      ),
                      Divider(),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/p.png",width: 30,),
                              Text("Durma Sende Sipariş Ver",
                              style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 20),
                              ),
                              Image.asset("assets/images/p.png",width: 30,),
                            ],
                          ),
                          Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), 
            child: Image.asset("assets/images/pa5.png", width: 200, height: 200),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), 
            child: Image.asset("assets/images/pa2.png", width: 200, height: 200),
          ),
        ],
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), 
            child: Image.asset("assets/images/pa3.png", width: 200, height: 200),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), 
            child: Image.asset("assets/images/pa6.png", width: 200, height: 200),
          ),
        ],
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), 
            child: Image.asset("assets/images/pa1.png", width: 200, height: 200),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), 
            child: Image.asset("assets/images/pa4.png", width: 200, height: 200),
          ),
        ],
      ),
    ],
  ),
),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {     //menubarım için widget tanımladım
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

  Widget StoryMenu(String photo, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(photo),
            radius: 40,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Padding gecmisSiparis() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.receipt_long,
                color: Colors.amber,
              ),
              Text(
                "Geçmiş Siparişlerim",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            "Tümü",
            style: TextStyle(
              color: Color.fromARGB(255, 229, 135, 4),
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Padding KampanyaKutu(String photo, String title, String tikla) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  photo,
                  width: 170,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    color: const Color.fromARGB(208, 158, 158, 158),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                tikla,
                style: TextStyle(
                    color: Color.fromARGB(208, 252, 193, 147),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
