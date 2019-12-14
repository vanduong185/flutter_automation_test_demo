import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyColor> listColor = [
    MyColor("red", Colors.red),
    MyColor("black", Colors.black),
    MyColor("blue", Colors.blue),
    MyColor("brown", Colors.brown),
    MyColor("pink", Colors.pink),
    MyColor("green", Colors.green),
  ];

  int selected = -1;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("What is your favorite color ?"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: listColor.length,
          itemBuilder: (context, index) {
            MyColor myColor = listColor[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: GestureDetector(
                key: Key('ges_${myColor.name}'),
                onTap: () {
                  onTapped(index);
                },
                child: Card(
                  key: Key('card_${myColor.name}'),
                  color: selected == index ? Colors.blue.shade100 : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        myColor.name,
                        key: ValueKey('text_${myColor.name}'),
                        style: TextStyle(
                          color: myColor.color,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  onTapped(int i) {
    setState(() {
      selected = i;
    });
  }
}

class MyColor {
  String name;
  Color color;

  MyColor(this.name, this.color);
}
