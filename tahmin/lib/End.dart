import 'package:flutter/material.dart';

import 'main.dart';

class End extends StatefulWidget {

  bool? sonuc;
  End({required this.sonuc});

  @override
  State<End> createState() => _EndState();
}

class _EndState extends State<End> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuç Ekranı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            (widget.sonuc!)?Image.asset("images/win.jpg",fit: BoxFit.cover,):Image.asset("images/sad.jpg",fit: BoxFit.cover,),
            (widget.sonuc!)?Text('Kazandınız',style: TextStyle(
              fontSize: 30,
              color:Colors.black26,
            ),):Text('Kaybettiniz',style: TextStyle(
              fontSize: 30,
              color:Colors.black26,
            ),),
            ElevatedButton(onPressed: (){
              Navigator.of(context).popUntil((route) => route.isFirst);
            }, child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Tekrar Dene"),
            )),
          ],
        ),
      ),
    );
  }
}

