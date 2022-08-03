import 'package:flutter/material.dart';
import 'package:flutter_arac_detay/arac_detay.dart';

import 'model/arac.dart';

class AracItem extends StatelessWidget {
  final Arac listelenenArac;
  const AracItem({required this.listelenenArac, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AracDetay(secilenArac: listelenenArac),
              ),
            );
          },
          leading: Image.asset(
            "images/" + listelenenArac.aracKucukResim,
            height: 100,
            width: 100,
          ),
          title: Text(
            listelenenArac.aracMarka,
            style: myTextStyle.headline5,
          ),
          subtitle: Text(
            listelenenArac.aracModel,
            style: myTextStyle.subtitle1,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
