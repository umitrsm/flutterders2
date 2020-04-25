import 'package:flutter/material.dart';
import 'package:harcamalardemo/models/transaction.dart';
import 'package:intl/intl.dart';

 class TransactionList extends StatelessWidget {
   final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 300,
      child: ListView.builder(
              itemBuilder: (ctx,index) {
                  return  Card(
                      color: Colors.limeAccent,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5, 
                      ),
                      child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                        vertical:10,
                        horizontal: 15),
                        decoration: BoxDecoration(border: Border.all(color: Colors.lightGreen)),
                        padding: EdgeInsets.all(10),
                        child: (Text((transactions[index].amount.toString() + ' ₺'),
                        style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent),
                        )
                      ),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text((transactions[index].title),
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color : Colors.pinkAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        Text(
                            DateFormat('yyyy/MM/dd hh:mm').format(transactions[index].date),
                          style: TextStyle(
                            fontSize: 10,
                            color : Colors.red
                          ),
                        ),
                      ]),
                  ]) 
                   );
              },
                itemCount: transactions.length,
              
              ),
    
    );
  }
}