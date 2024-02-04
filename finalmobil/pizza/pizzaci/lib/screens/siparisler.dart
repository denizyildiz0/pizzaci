import 'package:flutter/material.dart';

class SiparisScreen extends StatefulWidget {
  const SiparisScreen({super.key});

  @override
  State<SiparisScreen> createState() => _SiparisScreenState();
}

class _SiparisScreenState extends State<SiparisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade50,
        title: Text('Siparişlerim'),
      ),

       body: SingleChildScrollView(
        child: Column(
          children: [
            SepetItem(
                "assets/images/sepet1.png",
                "Pizza Gusto",
                "Bol Malzemos",
                "199TL",
                "Siparişiniz Hazırlanıyor..."),
            SizedBox(
              height: 2,
            ),
            SepetItem(
                "assets/images/kola.png",
                "Pizza Gusto",
                "Kola",
                "59TL",
                "Siparişiniz Hazırlanıyor..."),
                SizedBox(
              height: 2,
            ),
            SepetItem(
                "assets/images/sufle.png",
                "Pizza Gusto",
                "Sufle",
                "99TL",
                "Siparişiniz Hazırlanıyor..."),
            SizedBox(
              height: 2,
            ),
            SepetItem(
                "assets/images/sos.jpeg",
                "Pizza Gusto",
                "Ranch Sos",
                "19TL",
                "Siparişiniz Hazırlanıyor..."),
            
          ],
        ),
      ),
    );
  }
}

    
    



     

Widget SepetItem(String photo, String title, String description, String fiyat, String sepet) =>
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

  
   