import 'package:expressotec/pages/MyMachine.dart';
import 'package:expressotec/pages/auth_page.dart';
import 'package:expressotec/pages/bluetooth_page.dart';
import 'package:expressotec/pages/capsulas.dart';
import 'package:expressotec/pages/prepNow_page.dart';
import 'package:expressotec/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expressotec',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.authOrHome:(context) => const AuhtOrHome(),
        AppRoutes.bluetooth:(context) =>  const bluetooth(),
        AppRoutes.mymachine:(context) =>  MyMachine(),
        AppRoutes.capsulas:(context) =>   const Capsulas(),
        AppRoutes.prepNow:(context) =>   const PrepNow(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}




//   import 'package:android_intent/android_intent.dart';

// Future<void> _openApplicationDetails() async {
//     final AndroidIntent intent = const AndroidIntent(
//       action: 'android.bluetooth.devicepicker.action.LAUNCH',
//       // action: 'android.bluetooth.adapter.action.REQUEST_ENABLE',
//     );
//     await intent.launch();
//   }
//   ElevatedButton(
//    child: const Text(
//      'Tap here to open Application Details',
//    ),
//    onPressed: _openApplicationDetails),
              
