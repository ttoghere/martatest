// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:martatest/controllers/controllers.dart';
import 'package:martatest/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InvoiceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExpensesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Guzel',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF1F5F9),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5850EC)),
          useMaterial3: true,
        ),
        home: LoginScreen(adaptiveRatio: 1),
        routes: {
          DashboardMobilScreen.routeName: (context) =>
              const DashboardMobilScreen(),
          DashboardWebScreen.routeName: (context) => const DashboardWebScreen(),
        },
      ),
    );
  }
}
