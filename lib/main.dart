import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'home.dart';
//import 'package:json_annotation/json_annotation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

String pt_name = '';
String user_dat_file = "user.dat";

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () async {
      String user_dat_path = await Utils().filePath(user_dat_file);
      print(user_dat_path);
      if (File(user_dat_path).existsSync()){
        //print("test1");
        pt_name = await Utils().readFile(user_dat_file);
        pt_name = pt_name.split('\n')[0].split(' ')[2]; // line 1 col 3
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen()));
      }
      else{
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => User_Name(), // First time user, gets u/n page
            ));
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Welcome to Adhere',
          ),
        ),
        body: Column(
            children: [
              //Image.asset("/assets/images/undraw_medicine_b1ol.png"),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(35),
                  child: Text(
                    'The goal of this app is to help keep track of your daily medication and aid in the regulation of your health routines.\nGood luck, and Stay Healthy!\n- Adhere Labz',
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]
        )
    );
  }
}


class User_Name extends StatelessWidget {

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: const Text('First name has not been entered'),
          backgroundColor: Colors.red,
          action: SnackBarAction(label: "Don't Ask Again", onPressed: () async{
            print('TODO');
            //TODO
            Utils().writeToFile(user_dat_file, "# f_n $pt_name");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen()));
          },
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tec = new TextEditingController();
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Hello User!',
            style: new TextStyle(color: Colors.blue),
            textAlign: TextAlign.left,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Please enter your first name",
                style: TextStyle(color: Colors.grey, fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: tec,
                onChanged: (String text) {
                  pt_name = text;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.blue, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlue, width: 3.0),
                  ),
                ),
              ),
            ),
            Builder( builder: (context) => IconButton(icon: Icon(Icons.arrow_forward), onPressed: () async{
              pt_name = tec.text;
              if(tec.text != ''){
                //print("test3");
                Utils().writeToFile(user_dat_file, "# f_n $pt_name");
                print('TODO');
                //TODO
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen())); // Replace with Home Screen
                // print(pt_name);
              }
              else{
                _showToast(context);
              }}),
            ),
          ],
        ),
      ),
    );
  }
}

class Utils{

  // HELPER FUNCTIONS
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> filePath(String filename) async {
    String root_dir = await _localPath;
    return "$root_dir/$filename";
  }

  Future<File> get_file(String filename) async {
    return File(await filePath(filename));
  }

  Future<File> writeToFile(String filename, String string) async {
    final file = await get_file(filename);
    // Write the file.e
    return file.writeAsString('$string');
  }

  Future<String> readFile(String filename) async {
    try {
      final file = await get_file(filename);

      // Read the file.
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0.
      return '0';
    }
  }

}