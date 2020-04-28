import 'package:flutter/material.dart';
import 'package:harcamalardemo/models/transaction.dart';
import 'package:intl/intl.dart';

 class TransactionList extends StatelessWidget {
   final List<Transaction> transactions;
    Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 320,
      child: transactions.isEmpty ? Column(children: <Widget>[
          Text('Henüz İşlem Eklenmedi',
          style: Theme.of(context).textTheme.title,),
          SizedBox(//Boşluk Oluşturmak için Kullanılır
            height: 10,
          ),
          Container(
            height: 200,
            child:
            Image.asset('assets/images/ogemi.jpeg',
            fit: BoxFit.cover,)
            ,)
      ],): ListView.builder(
              itemBuilder: (ctx,index) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 18,
                    ),
                  child:ListTile(
                    leading: CircleAvatar(radius: 30,
                    child:Padding(padding: EdgeInsets.all(6),
                    child: FittedBox(
                     child: Text(transactions[index].amount.toStringAsFixed(2) + ' ₺'),),
                  ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete), 
                      onPressed:() => deleteTx(transactions[index].id),
                      color: Theme.of(context).errorColor,),
                  ),
                  );
              },
                itemCount: transactions.length,
              
              ),
    
    );
  }
}
/*
 Card(
                      //color: Colors.limeAccent,
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
                        child: (Text((transactions[index].amount.toStringAsFixed(2) + ' ₺'),
                        style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,
                       // color: Colors.deepPurpleAccent
                        )
                        ,
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
 */