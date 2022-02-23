import 'package:flutter/material.dart';
import 'package:life_expented_app/constants.dart';

class IconSex extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;

  IconSex({required this.cinsiyet, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 50, color: Colors.black54),
        SizedBox(height: 10),
        Text(
          cinsiyet,
          style: kMetinStili,
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  Color? renk;
  Widget? child;
  Function()? onPress;

  MyContainer({this.renk = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: renk,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
