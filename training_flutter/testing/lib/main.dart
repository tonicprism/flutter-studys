import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: 'Flutter Playground',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Playground'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 200), 
              child: Container(
                color: Colors.blue, 
                child: MyText(data: 'Child 1')
              )
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 200), 
              child: FittedBox(
                fit: BoxFit.fill,
                child: MyText(data: 'Child 2')
              )
            ),
            RotatedBox(quarterTurns: 1, child: MyText(data: 'Child 3')),
            SizedBox(
              height: 200,
              width: 200,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: Colors.amber,
                child: Center(child: MyText(data: 'Child 4')))
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

closeAlertDialog(BuildContext context) {
  return Navigator.of(context).pop();
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      // Clossing the dialog
      closeAlertDialog(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Hello"),
    content: Text("Hello i'm a Dialog."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class MyText extends StatelessWidget {
  final String data;
  final Color color;
  final Color bg;

  const MyText({Key key, this.data, this.color, this.bg}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(data, style: TextStyle(fontSize: 25, color: color, backgroundColor: bg),);
  }
}
