import 'package:flutter/material.dart';
import 'package:flutter_arac_detay/arac_item.dart';
import 'package:flutter_arac_detay/data/strings.dart';
import 'package:flutter_arac_detay/model/arac.dart';

class AracListesi extends StatelessWidget {
  late List<Arac> tumAraclar;

  AracListesi() {
    tumAraclar = verikaynaginihazirla();
    print(tumAraclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Araç listesi")),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return AracItem(
              listelenenArac: tumAraclar[index],
            );
          },
          itemCount: tumAraclar.length,
        ),
      ),
    );
  }

  List<Arac> verikaynaginihazirla() {
    List<Arac> gecici = [];
    for (int i = 0; i < 9; i++) {
      var _aracMarka = Strings.ARAC_MARKA[i];
      var _aracModel = Strings.ARAC_MODEL[i];
      var _aracYil = Strings.ARAC_YIL[i];
      var _aracDetay = Strings.ARAC_GENEL_OZELLIKLERI[i];
      var _aracKucukResim = Strings.ARAC_MARKA[i] + 'logo.png';
      var _aracBuyukResim = Strings.ARAC_MARKA[i].toLowerCase() + '_buyuk.png';
      Arac eklenecekArac = Arac(_aracMarka, _aracModel, _aracYil, _aracDetay,
          _aracKucukResim, _aracBuyukResim);
      gecici.add(eklenecekArac);
    }
    return gecici;
  }
}
