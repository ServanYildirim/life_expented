import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expented_app/constants.dart';
import 'my_widgets.dart';
import 'constants.dart';
import 'result_page.dart';
import 'userdata.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 15;
  double yapilanSpor = 3;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'YAŞAM BEKLENTİSİ',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
        ),
        body: Column(   
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildOutlinedButton('BOY'),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildOutlinedButton('KİLO'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Haftada Kaç Gün Spor Yapıyorsunuz ?',
                      style: kMetinStili,
                    ),
                    Text(yapilanSpor.round().toString(), style: kSayiStili),
                    Slider(
                        min: 0,
                        max: 7,
                        divisions: 7,
                        value: yapilanSpor,
                        onChanged: (double newValue) {
                          setState(() {
                            yapilanSpor = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Günde Kaç Sigara İçiyorsunuz ?',
                      style: kMetinStili,
                    ),
                    Text(
                      icilenSigara.round().toString(),
                      style: kSayiStili,
                    ),
                    Slider(
                        min: 0,
                        max: 30,
                        value: icilenSigara,
                        onChanged: (double newValue) {
                          setState(() {
                            icilenSigara = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'KADIN';
                        });
                      },
                      renk: seciliCinsiyet == 'KADIN'
                          ? Colors.pinkAccent[100]
                          : Colors.white,
                      child: IconSex(
                        cinsiyet: 'KADIN',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'ERKEK';
                        });
                      },
                      renk: seciliCinsiyet == 'ERKEK'
                          ? Colors.blueAccent[100]
                          : Colors.white,
                      child: IconSex(
                        cinsiyet: 'ERKEK',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              child: FlatButton(
                color: Colors.white,
                child: Text(
                  'Hesapla',
                  style: kMetinStili,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                UserData(
                                    boy: boy,
                                    kilo: kilo,
                                    seciliCinsiyet: seciliCinsiyet,
                                    icilenSigara: icilenSigara,
                                    yapilanSpor: yapilanSpor ),
                              )));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildOutlinedButton(String Label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text('$Label', style: kMetinStili),
        ),
        SizedBox(width: 10),
        RotatedBox(
          quarterTurns: -1,
          child: Text(Label == 'BOY' ? boy.toString() : kilo.toString(),
              style: kSayiStili),
        ),
        SizedBox(width: 25),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                onPressed: () {
                  setState(() {
                    Label == 'BOY' ? boy++ : kilo++;
                  });
                },
                child: Icon(FontAwesomeIcons.plus, size: 10),
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                onPressed: () {
                  setState(() {
                    Label == 'BOY' ? boy-- : kilo--;
                  });
                },
                child: Icon(FontAwesomeIcons.minus, size: 10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
