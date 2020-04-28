import 'package:flutter/material.dart';

import 'package:harcamalardemo/models/transaction.dart';
import 'package:harcamalardemo/widgets/chart.dart';
import 'package:harcamalardemo/widgets/new_Transaction.dart';
import 'package:harcamalardemo/widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Harcama',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
       // fontFamily: 'OpenSans'
      ),
      home: MyHomePage(),
          );
        }
      }
 class MyHomePage extends StatefulWidget {
        
        String titleInput;
        String amountInput;
      
 
  @override
  _MyHomePageState createState() =>_MyHomePageState();     
  
      }

class _MyHomePageState extends State<MyHomePage>{
  
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
 List<Transaction> get _recentTransactions{
   return _userTransaction.where((tx) {
     return tx.date.isAfter(DateTime.now().subtract(
       Duration(days: 7),
     ),
     );
   }).toList();
 }
 
  void _addNewTransaction(String txTitle, double txAmount,DateTime choosenDate){
    
    final newTx = Transaction( 
      id: DateTime.now().toString() ,
      title: txTitle,
      amount: txAmount,
      date: choosenDate,
      );
  
    setState(() {
    _userTransaction.add(newTx);
  });
} 
  void _startAddTransaction(BuildContext ctx){
          showModalBottomSheet(context: ctx, builder: (_) {
            return GestureDetector(
              onTap: () {},
              behavior:HitTestBehavior.opaque,
              child: NewTransaction(_addNewTransaction));
            
          });
        }
  void _deleteTransaction (String id) {
    setState(() {
      _userTransaction.removeWhere((tx){
        return tx.id == id;
      });
    });
  }      
   Widget build(BuildContext context){
            return Scaffold(
              appBar: AppBar(
                title: Text('Harcamalar Demo'),
                //  backgroundColor: Colors.lime,
                actions: <Widget>[
                IconButton(icon: Icon(Icons.add),
                color: Colors.pink,
                 onPressed: () => _startAddTransaction(context)),  
                ],
            ),
            body: SingleChildScrollView(
                   child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget>[
              Chart(_recentTransactions),
              TransactionList(_userTransaction,_deleteTransaction),
              ],
            ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
            onPressed: () => _startAddTransaction(context),
            child: Icon(Icons.add),),         
            );
  
          }

  
  
    
}


      
     
  
  