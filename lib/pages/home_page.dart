import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/model/team.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  final List<Team> teams = [];

  //sign out user
  void signOutUser() async{
     await FirebaseAuth.instance.signOut();
  }

  //get teams quotes
  Future geTeam() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    var jasonData = jsonDecode(response.body);

    for (var eachTeam in jasonData['data']) {
      final team = Team(
        abbrevitaion: eachTeam['abbrevitaion'],
        city: eachTeam['city'],
      );
      teams.add(team);
    }
    print(teams.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: GestureDetector(
          onTap: () => signOutUser(),
          child: const Text('Quotes'),
        ),
        leading: const CircleAvatar(),
      ),
    );
  }
}
