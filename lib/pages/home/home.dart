import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lab/models/user.dart';

import '../../theme/custom.dart';
import 'components/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = fecthUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.darkTheme.backgroundColor,
      child: FutureBuilder<List<User>>(
        future: users,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator(
              backgroundColor: Colors.transparent,
            );
          }
          List<User> users = snapshot.data ?? [];
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              User user = users[index];
              return HomeCard(
                title: 'Séance push',
                user: User(
                  username: user.username,
                  name: user.name,
                  pictureUrl: user.pictureUrl,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Future<List<User>> fecthUsers() async {
  List<User> users = [];

  for (int i = 1; i < 6; i++) {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users/$i'));

    if (response.statusCode == 200) {
      users.add(User.fromJson(jsonDecode(response.body)));
    }
  }

  return users;
}
