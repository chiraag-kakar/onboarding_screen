import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title = 'Demo'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                  buildCard(),
                ],
              )),
        ));
  }

  Card buildCard() {
    var ran = Random();
    var heading = '\$${(ran.nextInt(20) + 15).toString()}00 per month';
    var subheading =
        '${(ran.nextInt(3) + 1).toString()} bed, ${(ran.nextInt(2) + 1).toString()} bath, ${(ran.nextInt(10) + 7).toString()}00 sqft';
    var cardImage = NetworkImage(
        'https://source.unsplash.com/random/800x600?house&' +
            ran.nextInt(100).toString());
    var supportingText =
        'Beautiful home to rent, recently refurbished with modern appliances...';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
              trailing: Icon(Icons.favorite_outline),
            ),
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('CONTACT AGENT'),
                  onPressed: () {/* ... */},
                ),
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: () {/* ... */},
                )
              ],
            )
          ],
        ));
  }
}
