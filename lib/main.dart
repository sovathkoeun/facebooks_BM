import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(FaceBook());

class FaceBook extends StatefulWidget {
  @override
  _faceBookState createState() => _faceBookState();
}

class _faceBookState extends State<FaceBook> {
  Map users;
  List usersData;
  Future getUser() async {
    http.Response response = await http.get("http://reqres.in/api/users");
    users = json.decode(response.body);
    setState(() {
      usersData = users['data'];
    });
    // debugPrint(usersData.toString());
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Facebook'),
          backgroundColor: Colors.pink,
        ),
        body: ListView.builder(
          itemCount: usersData == null ? 0 : usersData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.network(usersData[index]['avatar'],
                        fit: BoxFit.cover,
                        height: 400.0,
                        width: 400.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(  
                      children: <Widget>[ 
                        CircleAvatar(
                          backgroundImage: NetworkImage(usersData[index]['avatar']),
                        ),
                  Padding(  
                    padding: const EdgeInsets.all(6.0),
                  ),
                  Text(
                      "${usersData[index]['first_name']}, ${usersData[index]['last_name']}",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(  
                      padding: const EdgeInsets.all(12.0),
                    ),
                    IconButton(
                     icon: Icon(Icons.thumb_up, color: Colors.blue,),
                     onPressed: () {},
                     ),

                    IconButton(
                     icon: Icon(Icons.thumb_down, color: Colors.blue,),
                     onPressed: () {},
                     ),

                    IconButton(
                     icon: Icon(Icons.share, color: Colors.blue,),
                     onPressed: () {},
                     ),

                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


//  Text(
//                       "${usersData[index]['first_name']}, ${usersData[index]['last_name']}",
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.pink,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),