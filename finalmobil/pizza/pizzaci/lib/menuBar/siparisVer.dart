import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pizzaci/menuBar/kampanya.dart';
import 'package:pizzaci/menuBar/sepet.dart';
import 'package:pizzaci/screens/data.dart';
import 'package:pizzaci/screens/home_screen.dart';
import 'package:pizzaci/menuBar/profilim.dart';
import 'package:pizzaci/screens/responsive.dart';

class SiparisVerScreen extends StatefulWidget {
  const SiparisVerScreen({super.key});

  @override
  State<SiparisVerScreen> createState() => _SiparisVerScreenState();
}

class _SiparisVerScreenState extends State<SiparisVerScreen> {
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

  //cihaz durumu başlangıç
  Screen device = Screen.mobile;

  //hangi cihazsa o ekranı gösterir
  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return MenuMobile();
      case (Screen.tablet):
        return Row(
          children: [
            SizedBox(width: 480, height: double.infinity, child: MenuMobile()),
            Expanded(child: MenuTablet()),
          ],
        );
      case (Screen.desktop):
        return Row(
          children: [
            SizedBox(width: 480, child: MenuMobile()),
            Expanded(child: MenuTablet()),
            SizedBox(width: 350, child: MenuDesktop()),
          ],
        );
    }
  }
  
  double fiyat = 250;       //desktop tasarımındaki fiyat filtrelemesi için

   
   String selectedPizza = "";

  @override
  Widget build(BuildContext context) {
    
    setState(() {                                                  //Cihazın durumunu tutmak için
      device = detectScreen(MediaQuery.of(context).size);
    });

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
          }
        },
        backgroundColor: Colors.white,
        color: Color.fromARGB(206, 255, 166, 50),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber.shade50,
        title: Text('Sipariş Ver'),
      ),
      body:  drawScreen(),
    );
  }

  Padding MenuTablet() {                 //tablet tasarımı
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Container(
          width: 600,
          child: Column(
           
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/pizzamenu.png",
                  height: 400,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Pizza seçimiyle ilgili sayfayı açabilirsiniz.
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sipariş İçin Detaylı Seçim Yapınız",
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),SizedBox(height: 10,),
              Container(
                width: 600,
                child: ExpansionTile(title: Text("Pizza Seçiniz",style: TextStyle(fontWeight: FontWeight.bold),),
                children: [
                  RadioListTile(
                    title: Text("Margarita"),
                    value: "Margarita",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Bol Etli Pizza"),
                    value: "Bol Etli Pizza",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Mantarsever"),
                    value: "Mantarsever",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Sucuksever"),
                    value: "Sucuksever",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Süperos pizza"),
                    value: "Süperos pizza",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Peperonni"),
                    value: "Peperonni",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Mexicano"),
                    value: "Mexicano",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Karışık"),
                    value: "Karışık",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Italino"),
                    value: "Italino",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Mangal Sucuklu"),
                    value: "Mangal Sucuklu",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 600,
                child: ExpansionTile(title: Text("Ekstra Malzeme Seçiniz",style: TextStyle(fontWeight: FontWeight.bold),),
                children: [
                  RadioListTile(
                    title: Text("Chedar"),
                    value: "Chedar",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Sucuk"),
                    value: "Sucuk",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Mozerella"),
                    value: "Mozerella",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Zeytin"),
                    value: "Zeytin",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Sosis"),
                    value: "Sosis ",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Tavuk"),
                    value: "Tavuk",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Biber"),
                    value: "Biber",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Mantar"),
                    value: "Mantar",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 600,
                child: ExpansionTile(title: Text("Yan Ürünler",style: TextStyle(fontWeight: FontWeight.bold),),
                children: [
                  RadioListTile(
                    title: Text("Soğan Halkası"),
                    value: "Soğan Halkası",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Çıtır Peynir"),
                    value: "Çıtır Peynir",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Çıtır Tavuk"),
                    value: "Çıtır Tavuk",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Çıtır Tavuk Topları"),
                    value: "Çıtır Tavuk Topları",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Elma Dilim Patates"),
                    value: "Elma Dilim Patates",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Muffin"),
                    value: "Tavuk",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 600,
                child: ExpansionTile(title: Text("Soslar",style: TextStyle(fontWeight: FontWeight.bold),),
                children: [
                  RadioListTile(
                    title: Text("Ranch Sos"),
                    value: "Ranch Sos",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Barbekü Sos"),
                    value: "Barbekü Sos",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Bufalo Sos"),
                    value: "Bufalo Sos",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Ketçap"),
                    value: "Ketçap",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Mayonez"),
                    value: "Mayonez",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 600,
                child: ExpansionTile(title: Text("İçecekler",style: TextStyle(fontWeight: FontWeight.bold),),
                children: [
                  RadioListTile(
                    title: Text("Kola"),
                    value: "Kola",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Fanta"),
                    value: "Fanta",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Ayran"),
                    value: "Ayran",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Ice-Tea"),
                    value: "Ice-Tea",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Su"),
                    value: "Su",
                    groupValue: selectedPizza,
                    onChanged: (value) {
                      setState(() {
                        selectedPizza = value.toString();
                      });
                    },
                  ),
                ],
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green)),
                            child: Text("Sepete Ekle",style: TextStyle(color: Colors.white),)),
                      
                     
                    
                  
                
              
            ],
          ),
        ),
      ),
    );
  }

  Padding MenuDesktop() {               //desktop tasarımını burada yaptım
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            width: 400,
            height: 1200,
            color: Color.fromARGB(206, 242, 242, 242),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alt Kategoriler",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        CheckboxListTile(
                          title: Text("Uygulamaya Özel Fırsatlar"),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        CheckboxListTile(
                          title: Text("Haftanın Kampanyaları"),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        CheckboxListTile(
                          title: Text("Şubeye Özel Fırsatlar"),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        CheckboxListTile(
                          title: Text("4 Kişi ve Üzeri Fırsatlar"),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        CheckboxListTile(
                          title: Text("2-3 Kişilik Kampanyalar "),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        CheckboxListTile(
                          title: Text("Tek Kişilik Kampanyalar "),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                      ],
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Fiyat",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text('₺${fiyat.round()}',
                      style:TextStyle(color: Colors.amber,
                      fontSize: 20)),
                    ),
                    Slider(
                      min: 0,
                      max: 500,
                      value: fiyat,
                      onChanged: (double newValue) {
                        setState(() {
                          fiyat = newValue;
                        });
                      },
                      activeColor: Colors.amber,
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Porsiyonlar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.amber)),
                              child: Text("Tek Kişilik")),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.amber)),
                              child: Text("2-3 Kişilik")),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.amber)),
                              child: Text("4+ Kişilik"))
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ekstralar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CheckboxListTile(
                          title: Text("Pizetta"),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        CheckboxListTile(
                          title: Text("Patates"),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        CheckboxListTile(
                          title: Text("Soğan Halkası"),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        CheckboxListTile(
                          title: Text("Çıtır Peynir"),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        CheckboxListTile(
                          title: Text("Çıtır Tavuk"),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                        CheckboxListTile(
                          title: Text("Sufle"),
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                      ],
                    ),
                  ]),
            )),
      ),
    );
  }

 
  ListView MenuMobile() {
    return ListView.builder(
      itemCount: menu1.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    menu1[index]["image1"].toString(),
                    width: 220,
                  ),
                ),
                SizedBox(width: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    menu2[index]["image2"].toString(),
                    width: 220,
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
