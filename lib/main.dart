import 'package:db_connection/connector.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var db = new MySQL();
  var info = 'No data so far';

  void _getConnection() {
    db.getConnection().then((conn){
      String sql = "SELECT info FROM info";
      conn.query(sql).then((results) {
        for(var row in results) {
          setState(() {
            print('hello');
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "API Integration",
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red[400],
        child: Center(
          child: Text(info),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getConnection,
        child: Icon(
          Icons.local_activity,
        ),
      ),
    );
  }
}