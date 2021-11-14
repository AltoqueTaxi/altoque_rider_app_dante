import 'package:driver_app/providers/application_provider.dart';
import 'package:driver_app/routes/app_routes.dart';
import 'package:driver_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (_) => CambiaVisible()),
        ChangeNotifierProvider(create: (_) => ApplicatiionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicatiionProvider(),
      child: MaterialApp(
        title: 'Conecta Firestore',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
        ),
        initialRoute: Routes.home,
        routes: appRoutes,
      ),
    );
  }
}
