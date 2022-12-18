import 'dart:math';
import 'package:flutter/material.dart';
import 'End.dart';

class Guess extends StatefulWidget {
  const Guess({Key? key}) : super(key: key);

  @override
  State<Guess> createState() => _GuessState();
}

class _GuessState extends State<Guess> {

  int hak=5;
  var tfController=TextEditingController();
  var randomNum=Random().nextInt(101);
  String help="";
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    print(randomNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Kalan Hak : ${hak}",style: TextStyle(
              fontSize: 30,
              color:Colors.pink,
            ),),
            Text("Yardım : ${help}",style: TextStyle(
              fontSize: 20,
              color: Colors.black26,
            ),),
             Form(
              key: formKey,
               child: Column(
                 children: [
                   TextFormField(
                     controller: tfController,
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       labelText: 'Tahmin',
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                     ),
                     validator: (girilenDeger){
                       if(girilenDeger!.isEmpty){
                         print(girilenDeger);
                         return "Tahmin Giriniz !";
                       }
                       return null;
                     },
                   ),

                   ElevatedButton(onPressed: (){
                     bool tahminControl = formKey.currentState!.validate();

                     if(tahminControl){
                       int tahmin = int.parse(tfController.text);
                       if(tahmin>randomNum){
                         setState(() {
                           help='Tahmin azalt';
                           hak--;
                           tfController.text="";
                           print('Tahmin azalt');
                         });
                       }
                       else if(tahmin<randomNum){
                         setState(() {
                           help='Tahmin arttır';
                           hak--;
                           tfController.text="";
                           print('Tahmin arttır');
                         });
                       }
                       else if(tahmin==randomNum){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>End(sonuc: true)));
                       }
                       if(hak==0){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>End(sonuc: false)));
                       }
                     }
                   },
                     child: Padding(
                       padding: const EdgeInsets.only(top:12,bottom: 12,left:24,right: 24),
                       child: Text("TAHMİN ET"),
                     ),style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.pink,
                       foregroundColor: Colors.white,
                     ),),
                 ],
               ),

             ),



          ],
        ),
      ),
    );
  }
}
