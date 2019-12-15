import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.deepOrangeAccent
      ),
    )
  );
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var eingabe;
  List items = new List();

  void initState() {
    items.add("Nr 1");
    items.add("Nr 2");
    items.add("Nr 3");
    items.add("Nr 4");
    items.add("Nr 5");
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Liste", textDirection: TextDirection.ltr),
      ),
      body: ListView.builder(
          itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(items[index]),
              child: ListTile(
                title: Text("${items[index]}"),
              ),
              onDismissed: (direction) {
                items.removeAt(index);
              },
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context)  {
              return new AlertDialog(
                title: new Text("Aufgabe hinzufügen"),
                content: new TextField(
                  onChanged: (String value) {
                    eingabe = value;
                  },
                ),
                actions: <Widget>[
                  new FlatButton(
                      child: new Text("Hinzufügen"),
                      onPressed: (){
                        setState(() {
                          items.add(eingabe);
                        });
                      },
                  )
                ],
              );
            }
          );
        },
      ),
    );

  }
}
