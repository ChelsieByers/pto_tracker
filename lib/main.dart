import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(PTOInputApp());
}

class PTOInputApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chelsie's PTO Tracker",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: PTOInputPage(),
    );
  }
}

class PTOInputPage extends StatefulWidget {

  @override
  _PTOInputPageState createState() => _PTOInputPageState();
}

class _PTOInputPageState extends State<PTOInputPage> {
  final dateFormat = DateFormat('MM/dd/YYYY');
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();


  void _submitPTO() {
    if (startDateController.text.isEmpty || endDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter both start and ends dates.')),
      );
      return;
    }

    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('PTO Submitted'),
            content: Text('You have submitted PTO!\n'
                'Great job managing your work/life balance!'
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('PTO Tracker'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the PTO Tracker!\n Please add in your next PTO',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded (
                  child: TextField(
                    controller: startDateController,
                    decoration: InputDecoration(
                      labelText: 'Start Date (MM/DD/YYYY',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 10),
                Expanded (
                  child: TextField(
                    controller: endDateController,
                    decoration: InputDecoration(
                      labelText: 'End Date (MM/DD/YYYY',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
            ],
            ),
            SizedBox(height:20),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: AssetImage('images/vacation.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "You've earned this! Make the most of it!\n Enjoy your PTO!!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitPTO,
        child: Icon(Icons.check),
        tooltip: 'Submit PTO',
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
