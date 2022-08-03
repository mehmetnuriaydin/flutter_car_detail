import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arac_detay/model/arac.dart';
import 'package:palette_generator/palette_generator.dart';

class AracDetay extends StatefulWidget {
  final Arac secilenArac;
  const AracDetay({required this.secilenArac, Key? key}) : super(key: key);

  @override
  State<AracDetay> createState() => _AracDetayState();
}

class _AracDetayState extends State<AracDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();

    appbarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          centerTitle: true,
          backgroundColor: appbarRengi,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
                widget.secilenArac.aracMarka + widget.secilenArac.aracModel,
                style: TextStyle(color: Colors.white)),
            background: Image.asset(
              'images/' + widget.secilenArac.aracBuyukResim,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Center(
                  child: Text(
                widget.secilenArac.aracDetay,
                style: Theme.of(context).textTheme.headline5,
              )),
            ),
          ),
        )
      ],
    ));
  }

  void appbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.secilenArac.aracBuyukResim}'));
    appbarRengi = _generator.vibrantColor!.color;
    setState(() {});
    print(appbarRengi);
  }
}
