import 'package:flutter/material.dart';
import 'package:pizzaci/fonts/app_text_style.dart';

//giriş yap button
class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical:10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              backgroundColor: color),
          child: Text(
            text,
            style: AppTextStyle.MIDDLE_BUTTON_TEXT,
          ),
        ),
      ),
    );
  }
}
