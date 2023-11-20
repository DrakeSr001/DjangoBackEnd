import 'package:flutter/material.dart';
import 'package:task/Models/model.dart';
import 'package:task/Screens/addperson.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:task/Screens/updateperson.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int isLoaded = 0;

  List<Persons> peopleList = [];

  getAllPersons() async {
    peopleList = [];
    isLoaded = 0;
    String path = 'http://192.168.1.108:3000/people';
    final response = await http.get(Uri.parse(path));
    if (response.statusCode == 200) {
      List ResponseAfterDecode = jsonDecode(response.body);
      for (var per in ResponseAfterDecode) {
        peopleList.add(Persons.fromJson(per));
      }
      if (peopleList.isEmpty) {
        isLoaded = 3;
      } else {
        isLoaded = 1;
      }
    } else {
      isLoaded = 2;
    }
    setState(() {});
  }

  deletePerson(int index) async {
    String path =
        'http://192.168.1.108:3000/DeletePerson/${peopleList[index].id}';
    final response = await http.delete(Uri.parse(path));
    if (response.statusCode == 204) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Deleted Successfully')));
      getAllPersons();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to delete')));
    }
  }

  @override
  void initState() {
    super.initState();
    getAllPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text('Persons List'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdatePeople()), // Remove 'const'
                ).then((value) {
                  // Refresh the list when returning from UpdatePeople page
                  getAllPersons();
                });
              },
              icon: Icon(Icons.update),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddPeople()),
                ).then((value) {
                  // Refresh the list when returning from AddPeople page
                  getAllPersons();
                });
              },
              icon: Icon(Icons.person_add),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: isLoaded == 1
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: peopleList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(peopleList[index].id.toString()),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      deletePerson(index);
                    },
                    child: ListTile(
                      title: Row(
                        children: [
                          CircleAvatar(
                            child: Text(peopleList[index].id.toString()),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(peopleList[index].username!),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : isLoaded == 0
                ? Center(child: CircularProgressIndicator())
                : isLoaded == 2
                    ? Center(
                        child: Text('Failed to load API'),
                      )
                    : Center(
                        child: Text('There\'s Nobody!'),
                      ),
      ),
    );
  }
}
