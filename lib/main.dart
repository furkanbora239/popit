import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const popit(),
    );
  }
}

class popit extends StatefulWidget {
  const popit({super.key});

  @override
  State<popit> createState() => _popitState();
}

class _popitState extends State<popit> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    super.initState();
  }

  bool buble = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(color: Colors.red),
        ),
        GestureDetector(
          onTapDown: (details) {
            setState(() {
              buble = false;
              HapticFeedback.lightImpact();
            });
          },
          onTapUp: (details) {
            setState(() {
              buble = true;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            height: 140,
            width: 140,
            decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                boxShadow: buble
                    ? [
                        const BoxShadow(
                            offset: Offset(-6, -6),
                            color: Color.fromARGB(118, 255, 255, 255),
                            blurRadius: 15,
                            spreadRadius: 5),
                        BoxShadow(
                            offset: const Offset(6, 6),
                            color: Colors.red.shade800,
                            blurRadius: 15,
                            spreadRadius: 5)
                      ]
                    : [],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: buble
                        ? [Colors.red.shade200, Colors.red, Colors.red.shade800]
                        : [
                            Colors.red.shade800,
                            Colors.red,
                            Colors.red.shade300
                          ])),
          ),
        )
      ],
    );
  }
}
