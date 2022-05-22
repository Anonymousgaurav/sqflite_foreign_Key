import 'package:databse_operations_sqflite/data/contact_operations.dart';
import 'package:databse_operations_sqflite/models/contact.dart';
import 'package:databse_operations_sqflite/presentation/widgets/contact_list.dart';
import 'package:databse_operations_sqflite/presentation/widgets/horizontal_button_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key? key})
      : super(
          key: key,
        );

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  ContactOperations contactOperations = ContactOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLite Tutorial'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HorizontalButtonBar(),
              FutureBuilder(
                future: contactOperations.getAllContacts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print('error');
                  var data = snapshot.data;
                  return snapshot.hasData
                      ? ContactsList(data as List<Contact>)
                      : new Center(
                          child: Text('You have no contacts'),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
