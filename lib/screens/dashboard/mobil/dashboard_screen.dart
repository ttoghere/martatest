import 'package:flutter/material.dart';
import 'package:martatest/controllers/profile_provider.dart';
import 'package:provider/provider.dart';

class DashboardMobilScreen extends StatefulWidget {
  static const routeName = "/dashmobil";
  const DashboardMobilScreen({super.key});

  @override
  State<DashboardMobilScreen> createState() => _DashboardMobilScreenState();
}

class _DashboardMobilScreenState extends State<DashboardMobilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: context.read<ProfileProvider>().getUserProfileInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final Map<String, dynamic> userProfileInfo = snapshot.data!['data'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User ID: ${userProfileInfo['user_id']}'),
                    Text('Screen Name: ${userProfileInfo['screen_name']}'),
                    Text('User Name: ${userProfileInfo['user_name']}'),
                    // Add other user profile information here
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
