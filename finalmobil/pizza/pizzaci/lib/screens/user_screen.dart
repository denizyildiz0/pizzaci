import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizzaci/componenets/kayit_input_field.dart';
import 'package:pizzaci/componenets/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {   

  TextEditingController adController = TextEditingController(text: "");                //hafızaya verı kaydetme işlemi için controller tanımladım
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController sifreController = TextEditingController(text: "");
  TextEditingController telefonController = TextEditingController(text: "");

  @override
  void initState() {             //sayfa açıldıgında readData dakileri oku getir
    super.initState();
    readData();
  }

  storeData() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();     //ssayfaya girilenler

    storage.setString("ad", adController.text);
    storage.setString("email", emailController.text);
    storage.setString("sifre", sifreController.text);
    storage.setString("telefon", telefonController.text);
    
    

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Tebrikler..Üye Oldunuz!",
        style: TextStyle(color: Colors.black87),
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
    ));
  }

  readData() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();    //girilenleri okuma alanı

   
    var ad = storage.getString("ad");
    var email = storage.getString("email");
    var sifre = storage.getString("sifre");
    var telefon = storage.getString("telefon");

    setState(() {
      
      adController.text = ad ?? "";
      emailController.text = email ?? "";
      sifreController.text = sifre ?? "";
      telefonController.text = telefon ?? "";
      
    });
  }

  clearData() {             //hafızayı boşaltma bildirimi hangi cihazdan girildiyse o cihaza ait bildirim tasarımını göster
    if (kIsWeb) {
      //web
      clearDataIOS();
    }
    else{
      if (Platform.isIOS || Platform.isMacOS) {
      clearDataIOS();
    } else {
      clearDataMaterial();
    }
    }
  }

  clearDataIOS() {                         //hafızayı boşalt ma işlemi iOS'ta çalışmaktadır.
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => CupertinoAlertDialog(
              title: Row(children: [Icon(Icons.warning), Text("Uyarı!")]),
              content: Text("Tüm verileri siliceksiniz emin misiniz?"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () async {
                    final SharedPreferences storage =
                        await SharedPreferences.getInstance();
                    storage.clear();
                  },
                  child: Text("Yes"),
                  isDestructiveAction: true,
                ),
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("No"),
                ),
              ],
            ));
  }

  clearDataMaterial() async {                     //hafızayı boşalt ma işlemi android de çalışmaktadır.
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: Row(children: [Icon(Icons.warning), Text("Uyarı!")]),
              content: Text("Tüm verileri siliceksiniz emin misiniz?"),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences storage =
                          await SharedPreferences.getInstance();
                      storage.clear();
                    },
                    child: Text("Yes")),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("No")),
              ],
            ));
  }

 @override
  Widget build(BuildContext context) {                     //tasarımımı yaptıgım alan
   return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Opacity(
              opacity: 0.7,
              child: SvgPicture.asset(
                "assets/images/wave-3.svg",
                height: 190,
                width: 140,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(90.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 270,
                  ),
                ],
              ),
            ),
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    height: 440,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color(0xffF3F3F5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        KayitInputField(
                          isAdSoyad: true,
                          inPhoneNumber: "",
                          isEmail: false,
                          isPassword: false,
                          hintText: "Ad Soyad",
                          icon: Icons.person_2_outlined,
                          onChange: (value) {},
                        ),
                        KayitInputField(
                          isAdSoyad: true,
                          inPhoneNumber: "",
                          isEmail: true,
                          isPassword: false,
                          hintText: "E-mail",
                          icon: Icons.email_outlined,
                          onChange: (value) {},
                        ),
                        KayitInputField(
                          isAdSoyad: true,
                          inPhoneNumber: "",
                          isEmail: false,
                          isPassword: true,
                          hintText: "Şifre",
                          icon: Icons.lock_outlined,
                          onChange: (value) {},
                        ),
                        KayitInputField(
                          isAdSoyad: true,
                          inPhoneNumber: "",
                          isEmail: false,
                          isPassword: false,
                          hintText: "Telefon",
                          icon: Icons.phone,
                          onChange: (value) {},
                        ),
                        RoundedButton(
                          text: "Kayıt Ol",
                          onTap: 
                            storeData,
                            color: Color.fromARGB(255, 83, 86, 113), 
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Text("Şimdi Giriş Yap",
                          style: TextStyle(fontWeight:FontWeight.bold,
                          fontSize: 14,
                          color: Colors.orange),)
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
               ),

          Positioned(
            bottom: 0,
            child: Opacity(
              opacity: 0.4,
              child: SvgPicture.asset(
                "assets/images/wave-7.svg",
                height: 170,
                width: 110,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


  