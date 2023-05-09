import 'package:abd/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: 'zain', phone: '4544666'),
    UserModel(id: 2, name: 'zain', phone: '4544666'),
    UserModel(id: 3, name: 'zain', phone: '4544666'),
    UserModel(id: 4, name: 'zain', phone: '4544666'),
    UserModel(id: 5, name: 'zain', phone: '4544666'),
    UserModel(id: 6, name: 'zain', phone: '4544666'),
    UserModel(id: 7, name: 'zain', phone: '4544666'),
    UserModel(id: 8, name: 'zain', phone: '4544666'),
    UserModel(id: 1, name: 'zain', phone: '4544666'),
    UserModel(id: 2, name: 'zain', phone: '4544666'),
    UserModel(id: 3, name: 'zain', phone: '4544666'),
    UserModel(id: 4, name: 'zain', phone: '4544666'),
    UserModel(id: 5, name: 'zain', phone: '4544666'),
    UserModel(id: 6, name: 'zain', phone: '4544666'),
    UserModel(id: 7, name: 'zain', phone: '4544666'),
    UserModel(id: 8, name: 'zain', phone: '4544666'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUsersItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUsersItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
