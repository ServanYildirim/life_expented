import 'userdata.dart';

class Hesap {

  UserData _userData;
  Hesap(this._userData);

  double hesap (){

    double sonuc;

    sonuc = 90.0 + _userData.yapilanSpor! - _userData.icilenSigara!;
    sonuc = sonuc + (_userData.boy!/_userData.kilo!);

    if(_userData.seciliCinsiyet=='KADIN'){
      return sonuc+3;
    }
    else {
      return sonuc;
    }
  }

}