import 'package:flutter/material.dart';
import 'package:json_with_ui/Models/users_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UsersModel> usersModel = [];
  Future<List<UsersModel>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        usersModel.add(UsersModel.fromJson(i));
      }
      return usersModel = usersModel;
    } else {
      return usersModel = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blueAccent[700],
        title: const Text(
          'Users Screen',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              getUsers();
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: usersModel.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blueAccent.withOpacity(0.2),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 16, right: 8, top: 16, bottom: 16),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 8, right: 8, top: 16, bottom: 16),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 8, right: 16, top: 16, bottom: 16),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // child: Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 20,
                  //     vertical: 24,
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         color: Colors.amberAccent,
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(16),
                  //           child: Column(
                  //             children: [
                  //               RichText(
                  //                 text: TextSpan(
                  //                   text: 'ID: ',
                  //                   style: TextStyle(
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.blueAccent[700],
                  //                   ),
                  //                   children: <TextSpan>[
                  //                     TextSpan(
                  //                       text: '${usersModel[index].id}',
                  //                       style: const TextStyle(
                  //                         color: Colors.black,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //               RichText(
                  //                 text: TextSpan(
                  //                   text: 'Name: ',
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 16,
                  //                     color: Colors.blueAccent[700],
                  //                   ),
                  //                   children: <TextSpan>[
                  //                     TextSpan(
                  //                       text: usersModel[index].name,
                  //                       style: const TextStyle(
                  //                         color: Colors.black,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //               RichText(
                  //                 text: TextSpan(
                  //                   text: 'Username: ',
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 16,
                  //                     color: Colors.blueAccent[700],
                  //                   ),
                  //                   children: <TextSpan>[
                  //                     TextSpan(
                  //                       text: usersModel[index].username,
                  //                       style: const TextStyle(
                  //                         color: Colors.black,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 overflow: TextOverflow.ellipsis,
                  //                 maxLines: 1,
                  //               ),
                  //               RichText(
                  //                 text: TextSpan(
                  //                   text: 'Email: ',
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 16,
                  //                     color: Colors.blueAccent[700],
                  //                   ),
                  //                   children: <TextSpan>[
                  //                     TextSpan(
                  //                       text:
                  //                           usersModel[index].email.toString(),
                  //                       style: const TextStyle(
                  //                         color: Colors.black,
                  //                         fontWeight: FontWeight.normal,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 maxLines: 2,
                  //                 overflow: TextOverflow.ellipsis,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
