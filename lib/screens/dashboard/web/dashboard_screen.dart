import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:martatest/controllers/controllers.dart';
import 'package:provider/provider.dart';

class DashboardWebScreen extends StatefulWidget {
  static const routeName = "/dash";
  const DashboardWebScreen({super.key});

  @override
  State<DashboardWebScreen> createState() => _DashboardWebScreenState();
}

class _DashboardWebScreenState extends State<DashboardWebScreen> {
  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<ProfileProvider>(context);
    return Scaffold(
      body: FutureBuilder(
        future: profile.getUserProfileInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text("Veri Var"),
            );
          } else {
            return Center(
              child: Text("Sorun Var"),
            );
          }
        },
      ),
    );
  }
}
