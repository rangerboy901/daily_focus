import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class AddObjectiveScreen extends StatefulWidget {
  const AddObjectiveScreen({Key? key}) : super(key: key);

  @override
  State<AddObjectiveScreen> createState() => _AddObjectiveScreenState();
}

class _AddObjectiveScreenState extends State<AddObjectiveScreen> {
  final formKey = GlobalKey<FormState>();
  String _title = '';
  late String _priority;
  DateTime _date = DateTime.now();
  TextEditingController _dateController = TextEditingController();

  final DateFormat _dateFormat = DateFormat('MMM dd, yyyy');

  final List<String> _priorities =
  ['Idea PlaceHolder', 'Future', 'Near Future', 'Now!'];

  _handledDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormat.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            size: 30.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Add Objective',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25.0),
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 15.0),
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(fontSize: 17.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (input) => input!.trim().isEmpty
                      ? 'Please Enter an objective'
                      : null,
                  onSaved: (input) => _title = input!,
                  initialValue: _title,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: _dateController,
                  style: TextStyle(fontSize: 15.0),
                  onTap: _handledDatePicker,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    labelStyle: TextStyle(fontSize: 17),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 15.0),
                  decoration: InputDecoration(
                    labelText: 'Priority',
                    labelStyle: TextStyle(fontSize: 17.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (input) => _,
                  onSaved: (input) => _title = input!,
                  initialValue: _title,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
