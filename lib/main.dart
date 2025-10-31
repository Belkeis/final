import 'package:flutter/material.dart';
import 'screens/home_page.dart'; 
import 'screens/tracking_requests.dart';
import 'screens/online_request_page.dart';
import 'screens/required_documents_page.dart';
import 'screens/booking_page.dart';
import 'screens/digital_versions_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Request Tracking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2563EB),
        scaffoldBackgroundColor: const Color(0xFFF9FAFB),
        fontFamily: 'Cairo',
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(), // Your home page
        '/tracking': (context) => const RequestTrackingScreen(),
        '/online-request': (context) => const OnlineRequestPage(),
        '/required-documents': (context) => const RequiredDocumentsPage(),
      },
    );
  }
}
