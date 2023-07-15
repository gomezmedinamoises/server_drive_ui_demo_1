import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  List<Map<String, dynamic>> dataFromBackend = [
    {'type': 'SizedBox', 'height': 40.0},
    {'type': 'FlutterLogo', 'size': 100.0},
    {'type': 'SizedBox', 'height': 60.0},
    {'type': 'TextField', 'hint': 'Name', 'obscure': true},
    {'type': 'SizedBox', 'height': 15.0},
    {'type': 'TextField', 'hint': 'Email', 'obscure': true},
    {'type': 'SizedBox', 'height': 15.0},
    {'type': 'TextField', 'hint': 'Password', 'obscure': true},
    {'type': 'SizedBox', 'height': 15.0},
    {'type': 'MaterialButton', 'hint': 'Login'}
  ];

  @override
  Widget build(BuildContext context) {

    List<Widget> uiFromBackend = [];

    for (var element in dataFromBackend) {
      String type = element['type'];

      switch(type) {

        case 'SizedBox':
          uiFromBackend.add(SizedBox(height: element['height'],));
          break;

        case 'FlutterLogo':
          uiFromBackend.add(FlutterLogo(size: element['size'],));
          break;

        case 'TextField':
          uiFromBackend.add(TextField(
            obscureText: element['obscure'],
            decoration: InputDecoration(
              hintText: element['hint'],
              border: const OutlineInputBorder()
            ),
          ));
          break;

        case 'MaterialButton':
          uiFromBackend.add(MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            minWidth: double.infinity,
            child: Text(element['hint'], style: const TextStyle(color: Colors.white)),
          ));
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Server-Driven UI')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          children: [...uiFromBackend]
        ),
      )
    );
  }
}