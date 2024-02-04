import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IletisimScreen extends StatefulWidget {
  const IletisimScreen({super.key});

  @override
  State<IletisimScreen> createState() => _IletisimScreenState();
}

class _IletisimScreenState extends State<IletisimScreen> {
  instagram() {
    final Uri uri = Uri.parse("https://www.instagram.com/deniz.ylldzz/");
    launchUrl(uri);
  }

  mail() {
    final Uri uri = Uri.parse("mailto:denizz.yldz8@gmail.com?subject=Destek Talebi&body=Merhaba uygulamayla ilgili problemim var.");
      launchUrl(uri);
  }
  linkedin() {
      final Uri uri = Uri.parse("https://www.linkedin.com/in/denizyıldızz/");
      launchUrl(uri);
  }
  call() {
      final Uri uri = Uri.parse("tel:+905383045678");
      launchUrl(uri);
  }
  whatsapp() {
    final Uri uri = Uri.parse("https://wa.me/+906473738838393?text=merhaba yardımıcı olurmusunuz?");
      launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            "İletişime Hoşgeldiniz",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: Column(
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:50),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.rectangle,
              color: Color.fromARGB(255, 31, 31, 31),
              borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Merhabalar değerli müşterilerimiz istek taleplerinizi, öneri ve şikayetlerinizi aşağıdaki bağlantı linklerimizden bizimle iletişime geçerek iletebilirsiniz.",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(184, 231, 231, 234)),
                ),
              ),
            ),
          ),
          
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: instagram,
                  child: Image.asset(
                    "assets/images/instagram.png",
                    width: 70,
                  )),
              InkWell(
                  onTap: mail,
                  child: Image.asset(
                    "assets/images/love.png",
                    width: 70,
                  )),
              InkWell(
                  onTap: linkedin,
                  child: Image.asset(
                    "assets/images/linkedin2.png",
                    width: 70,
                  )),
              InkWell(
                  onTap: call,
                  child: Image.asset(
                    "assets/images/phone.png",
                    width: 70,
                  )),
              InkWell(
                  onTap: whatsapp,
                  child: Image.asset(
                    "assets/images/whatsapp.png",
                    width: 70,
                  )),
            ],
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Sağlıklı Mutlu Günler Dileriz...",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
