import 'package:flutter/material.dart';
import 'package:life_expented_app/constants.dart';
import 'package:life_expented_app/userdata.dart';
import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sonuç Sayfası'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                  Hesap(_userData).hesap().round().toString(),
                style: kMetinStili,
              )),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Geri Dön',
                    style: kMetinStili,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
