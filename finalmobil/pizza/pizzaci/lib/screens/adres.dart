import 'package:flutter/material.dart';

class AdresScreen extends StatefulWidget {
  const AdresScreen({super.key});

  @override
  State<AdresScreen> createState() => _AdresScreenState();
}

class _AdresScreenState extends State<AdresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade50,
        title: Text('Adreslerim'),
      ),

       body: SingleChildScrollView(
        child: Column(
          children: [
            
            SepetItem(
                "assets/images/harita.jpeg",
                "Evim",
                "İstanbul/Beşiktaş",
                "Akmaz Çeşme Sk. No:9",),
            SizedBox(
              height: 2,
            ),
            SepetItem(
                "assets/images/harita.jpeg",
                "İş Yerim",
                "İstanbul/Sarıyer",
                "Ayazağa",),

            Padding(
  padding: const EdgeInsets.all(20.0),
  child: Center(
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      child: Row(
        children: [
          Icon(Icons.add_location_alt_outlined, color: Colors.white),
          SizedBox(width: 8.0), 
          Text(
            "Yeni Bir Adres Ekle",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  ),
),
          ],
          
        ),
        
      ),
      
    );
  }
}

    
    



     

Widget SepetItem(String photo, String title, String description, String fiyat) =>
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

  
   