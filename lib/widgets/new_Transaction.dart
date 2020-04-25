import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

      final Function addTx;
      final titleController = TextEditingController();
      final amountController = TextEditingController();

      NewTransaction(this.addTx);

  Widget build (BuildContext context) {
    return       Card(
               elevation: 5,
               child: Container(
                 padding: EdgeInsets.all(10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: <Widget>[
                   TextField(
                     decoration: InputDecoration(
                       labelText: 'Baslik',
                     ),
                     controller: titleController,
                    /* onChanged: (value) {
                       titleInput = value;
                     } ,*/
                   ),
                   TextField(
                      decoration: InputDecoration(
                       labelText: 'Maliyet',
                   ),
                   controller: amountController,
                   /*onChanged: (val) {
                     amountInput = val;
                   },*/
                   ),
                   FlatButton(
                     child: Text('İşlem Ekle'),
                     textColor: Colors.black, 
                     onPressed: () {
                       addTx(titleController.text,double.parse(amountController.text));
                     },
                    ),
                 ],
                ),
               ),
             );
  }
}