import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class ObjectiveListScreen extends StatefulWidget {
  const ObjectiveListScreen({Key? key}) : super(key: key);

  @override
  State<ObjectiveListScreen> createState() => _ObjectiveListScreenState();
}

class _ObjectiveListScreenState extends State<ObjectiveListScreen> {


Widget _buildTask(int index) {
  return ListTile(
    title: Text('Objective Title'),
    subtitle: Text('February 5, 2023 | High'),
    trailing: Checkbox(
      onChanged: (value) {
      print(value);
    },
      activeColor: Theme.of(context).primaryColor,
      value: true,
    ),
  );
}







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
        onPressed: () =>
          print('navigate to add objective screen'),
          ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 80.0),
        itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text('My Objective',
                  style: TextStyle(color:
                  Colors.black87,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text('1 of 10',
                style: TextStyle(color:
                Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w600),
                ),
              ]
              )
            );
          }
          return _buildTask(index);
          },
      ),
    );
  }
}
