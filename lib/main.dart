import 'package:flutter/material.dart';

import 'package:harcamalardemo/models/transaction.dart';
import 'package:harcamalardemo/widgets/new_Transaction.dart';
import 'package:harcamalardemo/widgets/transaction_list.dart';
import 'package:harcamalardemo/widgets/user_Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Harcama',
      home: MyHomePage(),
          );
        }
      }
      
      class MyHomePage extends StatelessWidget {
        
        String titleInput;
        String amountInput;

        Widget build(BuildContext context){
          return Scaffold(
            appBar: AppBar(
              title: Text('Harcamalar Demo'),
          ),
          body: SingleChildScrollView(
                 child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget>[
              UserTransaction()
            ],
          ),
          ),
          );

        }
}