import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPeople extends StatefulWidget {
  const AddPeople({super.key});

  @override
  State<AddPeople> createState() => _AddPeopleState();
}

class _AddPeopleState extends State<AddPeople> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int isLoaded = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Add person'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username', // Label for the username field
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: firstnameController,
                decoration: InputDecoration(
                  labelText: 'First Name', // Label for the first name field
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: lastnameController,
                decoration: InputDecoration(
                  labelText: 'Last Name', // Label for the last name field
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email', // Label for the email field
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone', // Label for the phone field
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  isLoaded = 1;
                  CreatePerson(
                    usernameController.text,
                    firstnameController.text,
                    lastnameController.text,
                    emailController.text,
                    int.parse(phoneController.text),
                    context,
                  );
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CreatePerson(String username, String firstName, String lastName, String email,
      int phone, context) async {
    String path = 'http://192.168.1.108:3000/AddPerson';
    var body = {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
    };
    final response = await http.post(Uri.parse(path),
        body: jsonEncode(body),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Created Successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to create')));
    }
  }
}
