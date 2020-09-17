import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Buy bread', amount: 65, date: DateTime.now()),
    Transaction(id: 't2', title: 'Buy Shoes', amount: 25, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('CHART'),
                ),
              ),
              Card(
                elevation: 5,
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                      ),
                      FlatButton(
                          textColor: Colors.purple,
                          onPressed: () {},
                          child: Text('Add Transaction'))
                    ])),
              ),
              Column(
                  children: transactions.map((tx) {
                return Card(
                  child: Row(children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 1)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(tx.date.toString())
                        ])
                  ]),
                );
              }).toList())
            ]));
  }
}
