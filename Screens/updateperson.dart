import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdatePeople extends StatefulWidget {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? phone;

  const UpdatePeople({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  @override
  State<UpdatePeople> createState() => _UpdatePeopleState();
}

class _UpdatePeopleState extends State<UpdatePeople> {
  TextEditingController updatedUsernameController = TextEditingController();
  TextEditingController updatedFirstnameController = TextEditingController();
  TextEditingController updatedLastnameController = TextEditingController();
  TextEditingController updatedEmailController = TextEditingController();
  TextEditingController updatedPhoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updatedUsernameController.text = widget.username ?? '';
    updatedFirstnameController.text = widget.firstName ?? '';
    updatedLastnameController.text = widget.lastName ?? '';
    updatedEmailController.text = widget.email ?? '';
    updatedPhoneController.text = (widget.phone ?? 0).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Update person'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: updatedUsernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: updatedFirstnameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: updatedLastnameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: updatedEmailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: updatedPhoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Implement the update logic here
                  UpdatePerson(
                    updatedUsernameController.text,
                    updatedFirstnameController.text,
                    updatedLastnameController.text,
                    updatedEmailController.text,
                    int.parse(updatedPhoneController.text),
                    context,
                  );
                },
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Implement the UpdatePerson method similar to CreatePerson
  UpdatePerson(String username, String firstName, String lastName, String email,
      int phone, context) async {
    String path = 'http://192.168.1.108:3000/UpdatePerson'; // Update the URL
    var body = {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
    };
    final response = await http.put(
      Uri.parse(path),
      body: jsonEncode(body),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Updated Successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to update')));
    }
  }
}
