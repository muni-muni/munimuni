import 'package:flutter/material.dart';
import 'package:munimuni/Router.dart';
//Goal for today:
/// 1. Create a todo-list
/// 2. Save data in browser/local cache
///

class MuniMuni extends StatefulWidget {
  const MuniMuni({super.key});
  @override
  State<MuniMuni> createState() => _MuniMuniState();
}

class _MuniMuniState extends State<MuniMuni> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MuniMuni());
}
