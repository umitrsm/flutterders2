import 'package:flutter/material.dart';
import 'package:harcamalardemo/widgets/transaction_list.dart';

import 'new_Transaction.dart';
import '../models/transaction.dart';

 class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  
 final List<Transaction>_userTransaction = [
    Transaction(
            id: 't1',
            title: 'New Shoes',
            amount: 69.99,
            date:  DateTime.now()
            ,
            ),
             Transaction(
            id: 't2',
            title: 'New Bag',
            amount: 79.99,
            date:  DateTime.now()
            ,
            ),
             Transaction(
            id: 't3',
            title: 'New Shirt',
            amount: 39.99,
            date:  DateTime.now()
            ,
            ),

 ];
 
  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction( 
      id: DateTime.now().toString() ,
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      );
  

setState(() {
    _userTransaction.add(newTx);
  });
}


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction)
      ],
      
    );
  }
}