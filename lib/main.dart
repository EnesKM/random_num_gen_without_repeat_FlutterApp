import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Random Number Generator",
      theme: ThemeData(
        primaryColor: Colors.blueAccent[100],
      ),
      home: Ekran(),
    );
  }
}
class Ekran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Number Generator',
          style: TextStyle(
            color: Colors.blueGrey[800],
            fontSize: 30.0,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: AnaEkran(
      ),
      backgroundColor: Colors.blueGrey[800],
    );
  }
}
class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}
class _AnaEkranState extends State<AnaEkran> {
  num min, max, sayi;
  List<int>  numberList= List();
  TextEditingController min1 = TextEditingController();
  TextEditingController max1 = TextEditingController();
  TextEditingController adet = TextEditingController();

  sayiUret() {
    setState(() {
      min = num.parse(min1.text);
      max = num.parse(max1.text);
      sayi = num.parse(adet.text);
      for (var i = 0; i < sayi; i++) {
        Random rand = new Random();
        var output = min + rand.nextInt(max - min);
          numberList.add(output);
      }
      numberList.length=sayi;
    });
  }
  tekrarsizSayiUret() {
    setState(() {
          min = num.parse(min1.text);
          max = num.parse(max1.text);
          sayi = num.parse(adet.text);
          for (var i = 0; i < max+1000 ; i++) {
            Random rand = new Random();
            var output = min + rand.nextInt(max +1 - min);
             if  (!numberList.contains(output)) {
                   numberList.add(output);
             }
          }
          numberList.length=sayi;
    });
  }
  temizle() {
    setState(() {
    numberList.length=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        10,
      ),
      child: Center(
        child: Column(
          children:  <Widget>[
            Text("$numberList".toString(),
                style: TextStyle(
                  color: Colors.blueAccent[100],
                  fontSize: 35.0,
                  fontWeight: FontWeight.w400,
                )
            ),
            TextField(
              controller: min1,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                hintText: 'Bir sayı giriniz...',
                labelText: 'Alt sınır',
                suffixIcon: IconButton(
                  onPressed: () => min1.clear(),
                  icon: Icon(Icons.clear),
                )
              ),
            ),
            TextField(
              controller: max1,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                hintText: 'Bir sayı giriniz...',
                labelText: 'Üst sınır',
                  suffixIcon: IconButton(
                    onPressed: () => max1.clear(),
                    icon: Icon(Icons.clear),
                  )
              ),
            ),
            TextField(
              controller: adet,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                hintText: 'Bir sayı giriniz...',
                labelText: 'Kaç adet sayı ',
                  suffixIcon: IconButton(
                    onPressed: () => adet.clear(),
                    icon: Icon(Icons.clear),
                  )
              ),
            ),
            FlatButton(onPressed: sayiUret,
              color: Colors.blueAccent[100],
              child: Text("Sayı Üret",
                  style: TextStyle(
                    color: Colors.blueGrey[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  )
              ),
            ),
            FlatButton(onPressed: tekrarsizSayiUret,
              color: Colors.blueAccent[100],
              child: Text("Tekrarsız Sayı Üret",
                  style: TextStyle(
                    color: Colors.blueGrey[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  )
              ),
            ),
            FlatButton(onPressed: temizle,
              color: Colors.redAccent[100],
              child: Text("Sıfırla",
                  style: TextStyle(
                    color: Colors.blueGrey[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}