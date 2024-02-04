import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:pizzaci/screens/data.dart';
import 'responsive.dart';

class YorumScreen extends StatefulWidget {
  const YorumScreen({super.key});

  @override
  State<YorumScreen> createState() => _YorumScreenState();
}

class _YorumScreenState extends State<YorumScreen> {
  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return PeopleFrame();
      case (Screen.tablet):
        return Row(
          children: [
            SizedBox(width: 280, height: double.infinity, child: PeopleFrame()),
            VerticalDivider(),
            Expanded(child: ConversationsFrame()),
          ],
        );
      case (Screen.desktop):
        return Row(
          children: [
            SizedBox(width: 280, height: double.infinity, child: PeopleFrame()),
            VerticalDivider(),
            Expanded(child: ConversationsFrame()),
            VerticalDivider(),
            SizedBox(width: 280, height: double.infinity, child: SizedBox.expand(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("En Çok Tercih Edilen Pizzacı",
                    style: TextStyle(color: const Color.fromARGB(97, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),),
                  ),
                  Divider(),
                  Image.asset("assets/images/p.png"),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Bizi Tercih Ettiğiniz İçin Teşekkür Ederiz...",
                    style: TextStyle(color: const Color.fromARGB(97, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),),
                  )
              ],)
            )),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text("Yorumlar",
        style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 20),),
      ),
      backgroundColor: Colors.white,
      body: drawScreen(),
      drawer: null,
      bottomNavigationBar: null,
    );
  }

  ListView ConversationsFrame() {
    return ListView(
      children: [
        BubbleSpecialThree(
          text: 'Değerli yorumlarınız bizler için çok değerli efendim. Afiyetler dileriz...',
          color: Color.fromARGB(255, 243, 182, 27),
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Bizleri tercih ettiğiniz için teşekkür ederiz',
          color: Color.fromARGB(255, 243, 182, 27),
          tail: true,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Rica Ederim:)',
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "Ellerinize sağlık pizzalar gerçekten çok lezzetli.",
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "Patatesleriniz bi harikaa..",
          color: Color(0xFFE8E8EE),
          tail: true,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: 'Yorum için teşekkürler',
          color: Color.fromARGB(255, 243, 182, 27),
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Bir daha ki sefere yine bekleriz.',
          color: Color.fromARGB(255, 243, 182, 27),
          tail: true,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Herşey çok lezzetli ve titizlikle hazırlanmıştı.',
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "Ve servis çok hızlıı",
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
      ],
    );
  }

  ListView PeopleFrame() {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200,
            ),),),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween, 
          children: [
            CircleAvatar(
                  backgroundImage:
                      AssetImage(people[index]["avatar"].toString()),
                  radius: 32,
                ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(people[index]["name"].toString()),
                    Text(
                       people[index]["lastMsg"].toString(),
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                       softWrap: true,
                       style: TextStyle(
                         fontSize: 13,
                         color: Colors.grey,
                       ),
                     ),
                  ],
                ),
              ),
            ),
            Text(
              (people[index]["date"] as DateTime).hour.toString() +
                  ":" +
                  (people[index]["date"] as DateTime).minute.toString(),
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
