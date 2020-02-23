import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'main.dart';
import 'package:charts_flutter/flutter.dart';
import 'dart:collection';
import 'dart:developer';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
// import 'package:firebase/firebase.dart';
//import 'package:postgresql2/postgresql.dart';
// void main() {
//  runApp(HomeScreen());
// }

//private variables
// List<String> prescriptions = new List();
// String pid;

// class Card_{
//   final String Col_name;
//   final String Sci_name;
//   final int mg;
//   final String  interval;
//   final bool taken = false;

//   Card_({this.Sci_name, this.Col_name, this.mg, this.interval});
// }

// List<Card_> medi_Cards_ = new List();

// class CardManager{
//   void populate_cards(List<Card> cards){
//     for (var i = 0; i < cards.length; i++){
      
//     }
//   }
// }

// class DB{
//  @override
//  Widget build(BuildContext context) {
//    return new StreamBuilder<QuerySnapshot>(
//      stream: Firestore.instance.collection("patients").snapshots(),
//      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//        if (!snapshot.hasData){
//          print('no');
//          return Container();
//        }
//         else{
//           print(
//             get_patient_medicine_collection(snapshot));
//           return Container();
//         }
//
//      },
//    );
//  }
//AsyncSnapshot<QuerySnapshot> snapshot
//   get_patient_medicine_collection(){
//
////      return snapshot.data.documents
////        .map((doc) => doc[pid]).toList();
//    final CollectionReference pt_col = Firestore.instance.collection("patients");
//    print(pt_col.getDocuments());
//   }
//
//  //  void CollectPatients(DocumentSnapshot pat){
//  //    print(pat);
//  //  }
// }

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    //DB().get_patient_medicine_collection();
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

// class GenerateCardList extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     print('x');
//   }

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