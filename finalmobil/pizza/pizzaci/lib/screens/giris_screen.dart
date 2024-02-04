import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizzaci/componenets/square_box.dart';
import '../../fonts/app_text_style.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();


//Api çekme kodlarımı burada yazdım
void login(String email, password, BuildContext context) async {
  try {
    Response response = await post(Uri.parse('https://reqres.in/api/register'),   
        body: {"email": email, "password": password});
    if (response.statusCode == 200) {                        //kullanıcı apidekki ile aynıysa home sayfasına giriş yap
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(   //yanlış kullanıcı girişi uyarısı
        content: Text("Girdiğiniz Bilgiler Yanlış"),    
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating 
      ));
    }
  } catch (e) {
    print(e.toString());
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(            //üst taraftaki  sarı tasarım
            top: 0,
            child: Opacity(
              opacity: 0.6,
              child: SvgPicture.asset(
                "assets/images/wave-3.svg",
                height: 250,
                width: 150,
              ),
            ),
          ),
          SingleChildScrollView(                         
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(90.0),
              child: Row(                              //logo
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 280,
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
                  //emaii şifre giriş yap butonlarını burada yazdım
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    height: 330,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color(0xffF3F3F5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                
                                hintText: "E-mail",
                                icon: Icon(Icons.mail_outline_outlined,color: Color(0xFF3F3D56),),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 1.0,
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Color.fromARGB(255, 150, 149, 149))),
                                  fillColor: Color.fromARGB(255, 150, 149, 149),
                                  
                                  ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                                hintText: "Şifre",
                                icon: Icon(Icons.password,color: Color(0xFF3F3D56),),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 1.0,
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Color.fromARGB(255, 150, 149, 149))),
                                  fillColor: const Color.fromARGB(255, 150, 149, 149),
                                  ),
                                  ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Şifreni mi Unuttun?",
                            style: AppTextStyle.MINI_BOLD_DESCRIPTION_TEXT,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              login(emailController.text.toString(),
                               passwordController.text.toString(),
                               context);

                            },
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Color(0xFF3F3D56),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  "Giriş Yap",
                                  style: AppTextStyle.MIDDLE_BUTTON_TEXT,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 50,
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Ya da",
                        style: AppTextStyle.MINI_DESCRIPTION_TEXT,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        endIndent: 50,
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareBox(
                    ImagePath: "assets/images/google.jpeg",
                  ),
                  SizedBox(width: 20),
                  SquareBox(
                    ImagePath: "assets/images/apple.jpeg",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Üye Değil misin?",                 
                    style: TextStyle(color: Color.fromARGB(227, 126, 126, 126)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Text(
                      "Şimdi Üye Ol!",                                                         //kayıt ol sayfasına yönlendirme yaptım
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
          Positioned(                          //alttaki gri tasarım
            bottom: 1,
            child: Opacity(
              opacity: 0.2,
              child: SvgPicture.asset(
                "assets/images/wave-7.svg",
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
