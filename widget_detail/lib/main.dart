import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Widgetdetail());
}

class Widgetdetail extends StatefulWidget {
  const Widgetdetail({super.key});

  @override
  State<Widgetdetail> createState() => _WidgetdetailState();
}

class _WidgetdetailState extends State<Widgetdetail> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.acmeTextTheme()),
      home: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.red,
              child: Text("Hellasdddddddddo"),
            ),
          ),
          Flexible(
            child: Container(
              color: Color(0xFFFFC107),
              child: Text("Hello"),
            ),
          )
        ],
      ),
    );
  }
}
