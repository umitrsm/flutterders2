import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
      final Function addTx;
      NewTransaction(this.addTx);

  _NewTransactionState createState() => _NewTransactionState();

  }

  class _NewTransactionState extends State<NewTransaction>{
 
     
      final titleController = TextEditingController();
      final amountController = TextEditingController();
      DateTime _selectedDate;
      // String titleInput;
       // String amountInput;


 

      void _submitData() {
        if(amountController.text.isEmpty){
          return;
        }
          final enteredTitle = titleController.text;
          final enteredAmount = double.parse(amountController.text);
          
        if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate==null){
          return;
        }  
          widget.addTx(
            enteredTitle,
            enteredAmount,
            _selectedDate);
            Navigator.of(context).pop();//Ekleme Yaptıktan Sonra Kapatır
      }
      void _presentDatePicker(){
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime.now()).then((pickedDate) {
            if(pickedDate == null){
              return;
            }
            setState(() {
          _selectedDate = pickedDate;
            });
          });
      }

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
                 
                   keyboardType: TextInputType.number,
                  //onSubmitted: (_) => submitData,
                  /* onChanged: (val) {
                     amountInput = val;
                   },*/
                   ),
                   Container(
                     height: 70,
                  child: Row(
                     children: <Widget>[
                       Expanded(
                         child: Text
                         (_selectedDate == null ?  
                         'Tarih Secilmedi' : 
                         DateFormat.yMd().format(_selectedDate)),
                       ),
                       FlatButton(onPressed: _presentDatePicker, 
                       child: Text('Tarih Seç',style: TextStyle(fontWeight: FontWeight.bold),),
                       textColor: Theme.of(context).primaryColor,
                      
                       )
                     ],
                   ),
                   ),
                   RaisedButton(
                     color: Theme.of(context).primaryColor,
                     child: Text('İşlem Ekle'),
                     textColor: Colors.black, 
                     onPressed: () => _submitData(),               
                     ),
                 ],
                ),
               ),
             );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
  