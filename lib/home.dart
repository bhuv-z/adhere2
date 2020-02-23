import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'main.dart';
import 'package:charts_flutter/flutter.dart';
import 'dart:collection';
import 'dart:developer';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';


// void main() {
//  runApp(HomeScreen());
// }

//private variables

List<String> prescriptions = new List();

/* PIE CHART
class PieOutsideLabelChart extends StatelessWidget {
  final List<Series> seriesList;
  final bool animate;

  PieOutsideLabelChart(this.seriesList, {this.animate});

  factory PieOutsideLabelChart.withSampleData() {
    return new PieOutsideLabelChart(
      _inputData(),
      animate: false,
    );
  }

  @override
  Widget build (BuildContext ctxt) {
    return new PieChart(seriesList,
      animate: animate,
      defaultRenderer: new ArcRendererConfig(
        ArcRendererDecorators: [
          new ArcLabelDecorator(
            labelPosition: ArcLabelPosition.outside
          )
        ]
      )
    );
  }

  static List<Series<something, something>> _inputData() {
    final data = [
      //obtain data
    ];
    return [
      new Series<something, something>(
        id:
        domainFn: ,
        measureFn: ,
        data: data,
        labelAccessorFn: (something, _) => '${}: ${}',
      )
    ];
  }
}

//Data Struct
class PrescriptionChart {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

*/

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      home: new Home(),);
  }


}

class Home extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: Column (
        // Graph
        // Cards
        // Other
          children: [
            Text(""),
            //SingleChildScrollView(
            Column(
              children: [
                //Array to create multiple cards
                Card(
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        const ListTile(
                          //contentPadding)
                          leading: Icon(Icons.notifications_active),
                          title: Text('Tamiflu (sci name), 75 mg'),
                          subtitle: Text('1 pill every 12 hours for 3 days'),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('Did Not Take'),
                              onPressed: () {/*Tally Not Taken*/},
                            ),
                            FlatButton(
                              child: const Text('Slightly postpone'),
                              onPressed: () {/*Buffer time*/},
                            ),
                            FlatButton(
                              child: const Text('Took the Tablet!'),
                              onPressed: () {/*Tally Taken*/},
                            )
                          ],
                        )
                      ],
                    )
                ),
                Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          //contentPadding)
                          leading: Icon(Icons.notifications_active),
                          title: Text('Azithromycin (sci name), 100 mg'),
                          subtitle: Text('2 pills every day for 2 weeks'),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('Did Not Take'),
                              onPressed: () {/*Tally Not Taken*/},
                            ),
                            FlatButton(
                              child: const Text('Slightly postpone'),
                              onPressed: () {/*Buffer time*/},
                            ),
                            FlatButton(
                              child: const Text('Took the Tablet!'),
                              onPressed: () {/*Tally Taken*/},
                            )
                          ],
                        )
                      ],
                    )
                )
              ],
            )
            //)
          ]
      ),
      //Left / Center / Right Navigation
      bottomNavigationBar: new BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Metrics'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Prescriptions'),
          ),
        ],
      ),
    );
  }
}

class GenerateCardList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    print('x');
  }

//   void get_data(){
//     Firestore.instance.collection('patients').snapshots().listen((data) => data.patients.forEach((patient) => CollectPatients(patient)));
//       }


//     }

//     CollectPatients(patient) {}
// }


// class MediCards extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//               return  new Card(
//                     child: new Column(
//                       children: <Widget>[
//                         new Image.network('https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
//                         new Padding(
//                           padding: new EdgeInsets.all(7.0),
//                           child: new Row(
//                             children: <Widget>[
//                              new Padding(
//                                padding: new EdgeInsets.all(7.0),
//                                child: new Icon(Icons.thumb_up),
//                              ),
//                              new Padding(
//                                padding: new EdgeInsets.all(7.0),
//                                child: new Text('Like',style: new TextStyle(fontSize: 18.0),),
//                              ),
//                              new Padding(
//                                padding: new EdgeInsets.all(7.0),
//                                child: new Icon(Icons.comment),
//                              ),
//                              new Padding(
//                                padding: new EdgeInsets.all(7.0),
//                                child: new Text('Comments',style: new TextStyle(fontSize: 18.0)),
//                              )

//                             ],
//                           )
//                         )
//                       ],
//                     ),
//                   );
//   }
// }

// class FireBase{
//   void get_data(){
//     Firestore.instance.collection('patients').snapshots().listen((data) => data.documents.forEach((patient) => CollectPatients(patient)));
//   }
//   void CollectPatients(DocumentSnapshot pat){
//     //
//   }
}
//   void CollectPatients(DocumentSnapshot pat){
//     print(pat);
//   }
// }