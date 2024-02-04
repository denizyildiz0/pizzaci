import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizzaci/componenets/neu_box2.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {

     clearData() {                                 
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

  clearDataIOS() {            //ben tercihen ıos bıldırım tasarımı sectım 
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => CupertinoAlertDialog(
              title: Row(children: [Icon(Icons.warning), Text("Uyarı!")]),
              content: Text("Kullanıcıyı sileceksiniz emin misiniz?"),   //kullanıcıyı silmek hafızayı boşaltmak için bu alanı yazdım
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

  clearDataMaterial() async {       //android bildirim tasarımı
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: Row(children: [Icon(Icons.warning), Text("Uyarı!")]),
              content: Text("Kullanıcıyı sileceksiniz emin misiniz?"),
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
  Widget build(BuildContext context) {             //profile tasarımını burada yaptım
    return Scaffold(
      
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Opacity(
              opacity: 0.6,
              child: SvgPicture.asset(
                "assets/images/wave-10.svg",
                height: 250,
                width: 150,
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(bottom: 550),
              child: Center(
                child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  gradient: LinearGradient(colors: [
                    Colors.purple,
                    Colors.orange,
                    Color.fromARGB(255, 151, 145, 232),
                  ]),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                    "assets/images/kadin1.jpeg"),
                    radius: 100,
                  ),
                ),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Alessi Clark",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black87),),
                  )],
              ),
            ),
              
             Padding(
               padding: const EdgeInsets.only(top: 200),
               child: Center(
                 child: NeuBox(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text("K U L L A N I C I    B İ L G İ L E R İ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black87),),
                    SizedBox(height: 30),
                    Text("E-MAİL",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54),),
                    SizedBox(height: 5),
                    Text("eve.holt@reqres.in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black38),),
                    SizedBox(height: 20),
                    Divider(),
                    Text("ŞİFRE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54),),
                    SizedBox(height: 5),
                    Text("pistol",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black38),),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 40),
                    InkWell(
                      child:
                     TextButton(onPressed: clearDataIOS,        //kullanıcıyı sil hafıza boşaltma işlemi
                      child: Text("Kullanıcıyı Sil",
                       style: TextStyle(color: Color.fromARGB(221, 82, 43, 239)),),
                      style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 218, 217, 217)),
                      ),
                      )),
                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed:() {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                      style: ElevatedButton.styleFrom(
                         backgroundColor: const Color.fromARGB(255, 218, 217, 217),
                      ),
                     child: Text("Anasayfaya Dön",
                     style: TextStyle(color: Color.fromARGB(221, 82, 43, 239)),),
                    
                    ),
                  ],
                 )),
               ),
             ),
            
            
            Positioned(
            bottom: 1,
            child: Opacity(
              opacity: 0.2,
              child: SvgPicture.asset(
                "assets/images/wave-8.svg",
                height: 160,
                width: 170,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
