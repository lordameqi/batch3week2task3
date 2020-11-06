import 'package:flutter/material.dart';
import 'package:age/age.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  DateTime selectedDate = DateTime.now();

  //DateTime birthday = DateTime(1990, 1, 20);
  DateTime today = DateTime.now();
  AgeDuration age;

  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> umur() async {
    setState(() {
      age = Age.dateDifference(
          fromDate: selectedDate, toDate: today, includeToDate: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Hitung Umur'), automaticallyImplyLeading: false),
        body: Form(
          child: ListView(
            children: <Widget>[
              Text("${selectedDate.toLocal()}".split(' ')[0]),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () => {
                  _selectDate(context),
                  print(
                      selectedDate.day + selectedDate.month + selectedDate.year)
                },
                child: Text('Pilih Tanggal'),
              ),
              RaisedButton(
                child: Text('Umu saat ini adalah'),
                onPressed: () {
                  umur();
                },
              ),
              Text('${age ?? ''}'),
            ],
          ),
        ));
  }
}
