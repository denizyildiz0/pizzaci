import 'package:flutter/material.dart';
import 'package:pizzaci/menuBar/kampanya.dart';
import 'package:pizzaci/menuBar/sepet.dart';
import 'package:pizzaci/menuBar/siparisVer.dart';
import 'package:pizzaci/screens/adres.dart';
import 'package:pizzaci/screens/giris_screen.dart';
import 'package:pizzaci/screens/home_screen.dart';
import 'package:pizzaci/screens/iletisim.dart';
import 'package:pizzaci/screens/loading.dart';
import 'package:pizzaci/menuBar/profilim.dart';
import 'package:pizzaci/screens/siparis_takip.dart';
import 'package:pizzaci/screens/siparisler.dart';
import 'package:pizzaci/screens/user_screen.dart';
import 'package:pizzaci/screens/yorumlar.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/giris': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/yorum':(context) => YorumScreen(),
        '/siparis':(context) => SiparisScreen(),
        '/takip':(context) => SiparisTakipScreen(),
        '/adres':(context) => AdresScreen(),
        '/profil':(context) => ProfilScreen(),
        '/iletisim':(context) => IletisimScreen(),
        '/loading':(context) => LoadingScreen(),
        '/register':(context) => UserScreen(),
        '/kampanya':(context) => KampanyaScreen(),
        '/siparisver':(context) => SiparisVerScreen(),
        '/sepet':(context) => SepetScreen(),
        

      },
      initialRoute: '/giris',
    );
  }
}
