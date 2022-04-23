import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memzstudio/add_package_screen.dart';
import 'package:memzstudio/admin/appoinment_screen.dart';
import 'package:memzstudio/admin/dashboard.dart';
import 'package:memzstudio/admin_home_screen.dart';
import 'package:memzstudio/analysis_screen.dart';
import 'package:memzstudio/appointments_screen.dart';
import 'package:memzstudio/booking_details.dart';
import 'package:memzstudio/booking_screen.dart';
import 'package:memzstudio/contact_us_screen.dart';
import 'package:memzstudio/current_orders.dart';
import 'package:memzstudio/customer_packages_screen.dart';
import 'package:memzstudio/customers_screen.dart';
import 'package:memzstudio/forgot_password_screen.dart';
import 'package:memzstudio/help_screen.dart';
import 'package:memzstudio/home_screen.dart';
import 'package:memzstudio/orders_screen.dart';
import 'package:memzstudio/packages_screen.dart';
import 'package:memzstudio/payment_screen.dart';
import 'package:memzstudio/pre_orders.dart';
import 'package:memzstudio/profile_screen.dart';
import 'package:memzstudio/report_details_screen.dart';
import 'package:memzstudio/report_screen.dart';
import 'package:memzstudio/reset_password_screen.dart';
import 'package:memzstudio/status_screen.dart';

import 'admin/customer_screen.dart';
import 'admin/data_analyst_screen.dart';
import 'admin/packages.dart';
import 'admin/payment_screen_admin.dart';
import 'admin/report.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'index_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: const Color.fromRGBO(190, 186, 223, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color.fromRGBO(80, 80, 80, 1),
          primaryVariant: const Color.fromRGBO(153, 148, 193, 1),
          surface: const Color.fromRGBO(167, 167, 167, 1),
        ),
        fontFamily: 'Ubuntu',
      ),
      home: const PaymentScreenAdmin(),
      routes: {
        SignupScreen.routeName: (_) => const SignupScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        ForgotPasswordScreen.routeName: (_) => const ForgotPasswordScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        BookinScreen.routeName: (_) => const BookinScreen(null),
        PaymentScreen.routeName: (_) => const PaymentScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
        ReportScreen.routeName: (_) => const ReportScreen(),
        AdminHomeScreen.routeName: (_) => const AdminHomeScreen(),
        CustomersScreen.routeName: (_) => const CustomersScreen(),
        PackagesScreen.routeName: (_) => const PackagesScreen(),
        AppointmentScreen.routeName: (_) => const AppointmentScreen(),
        AnalysisScreen.routeName: (_) => const AnalysisScreen(),
        ReportDetailsScreen.routeName: (_) => const ReportDetailsScreen(),
        HelpScreen.routeName: (_) => const HelpScreen(),
        ResetPassword.routeName: (_) => const ResetPassword(),
        BookingDetails.routeName: (_) => const BookingDetails(),
        StatusScreen.routeName: (_) => const StatusScreen(),
        OrderScreen.routeName: (_) => const OrderScreen(),
        CurrentOrders.routeName: (_) => const CurrentOrders(),
        PrevoiusOrders.routeName: (_) => const PrevoiusOrders(),
        ContactUsScreen.routeName: (_) => const ContactUsScreen(),
        AddPackageScreen.routeName: (_) => const AddPackageScreen(),
        CustomerPackagesScreen.routeName: (_) => const CustomerPackagesScreen(),
      },
    );
  }
}
